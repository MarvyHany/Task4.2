part of 'auth_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String email;
  SignUpSuccess({required this.email});
}

class SignUpFailure extends SignUpState {
  final String error;
  SignUpFailure({required this.error});
}
