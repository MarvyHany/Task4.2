part of "auth_bloc.dart";

@immutable
abstract class SignUpEvent {}

class SignUpSubmittedEvent extends SignUpEvent {
  final String name;
  final String email;
  final String phone;
  final String password;

  SignUpSubmittedEvent({required this.name,
    required this.email,
    required this.phone,
    required this.password,});
}