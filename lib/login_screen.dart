import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'signup_screen.dart'; // عدّلي حسب مكان الملف
import 'bloc/auth_bloc.dart';


class LoginScreenWithBloc extends StatefulWidget {
  const LoginScreenWithBloc({super.key});

  @override
  State<LoginScreenWithBloc> createState() => _LoginScreenWithBlocState();
}

class _LoginScreenWithBlocState extends State<LoginScreenWithBloc> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Fluttertoast.showToast(
                  msg: "Login Successful", backgroundColor: Colors.green);
            } else if (state is LoginFailure) {
              Fluttertoast.showToast(
                  msg: state.error, backgroundColor: Colors.red);

              if (state.error.contains("Redirecting")) {
                // بعد شوية ينقله للتسجيل
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreenWithBloc(),
                    ),
                  );
                });
              }
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) =>
                          value!.contains('@') ? null : 'Enter a valid email',
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) =>
                          value!.length < 6 ? 'Min 6 characters' : null,
                    ),
                    const SizedBox(height: 30),
                    state is LoginLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginSubmittedEvent(
                                        email: _email.text.trim(),
                                        password: _password.text.trim(),
                                      ),
                                    );
                              }
                            },
                            child: const Text("Login"),
                          ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignUpScreenWithBloc()),
                        );
                      },
                      child: const Text("Don't have an account? Register"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
