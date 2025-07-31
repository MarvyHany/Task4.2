import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmittedEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    try {
      // تسجيل المستخدم في Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      // تعديل بيانات المستخدم (الاسم)
      await userCredential.user!.updateDisplayName(event.name);

      emit(SignUpSuccess(email: event.email));
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(error: e.message ?? 'Registration failed'));
    } catch (e) {
      emit(SignUpFailure(error: e.toString()));
    }
  }
}
