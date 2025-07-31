import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(LoginFailure("User not found. Redirecting to register..."));
        } else if (e.code == 'wrong-password') {
          emit(LoginFailure("Wrong password."));
        } else {
          emit(LoginFailure("Login failed: ${e.message}"));
        }
      } catch (e) {
        emit(LoginFailure("Unexpected error"));
      }
    });
  }
}

