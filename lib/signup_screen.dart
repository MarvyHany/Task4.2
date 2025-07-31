import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bloc/auth_bloc.dart';

class SignUpScreenWithBloc extends StatefulWidget {
  const SignUpScreenWithBloc({super.key});

  @override
  State<SignUpScreenWithBloc> createState() => _SigninScreenWithBlocState();
}

class _SigninScreenWithBlocState extends State<SignUpScreenWithBloc> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Register"),
          centerTitle: true,
        ),
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailure) {
              Fluttertoast.showToast(msg: state.error, backgroundColor: Colors.red);
            } else if (state is SignUpSuccess) {
              Fluttertoast.showToast(
                  msg: "Welcome ${state.email}", backgroundColor: Colors.green);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    _buildTextField(controller: _name, label: "Name", icon: Icons.person, validator: (val) => val!.isEmpty ? "Enter your name" : null),
                    const SizedBox(height: 15),
                    _buildTextField(controller: _phone, label: "Phone Number", icon: Icons.phone, keyboardType: TextInputType.phone, validator: (val) => val!.isEmpty ? "Enter your phone" : null),
                    const SizedBox(height: 15),
                    _buildTextField(controller: _email, label: "Email", icon: Icons.email, keyboardType: TextInputType.emailAddress, validator: (val) => val!.contains('@') ? null : "Enter a valid email"),
                    const SizedBox(height: 15),
                    _buildTextField(controller: _password, label: "Password", icon: Icons.lock, obscure: true, validator: (val) => val!.length < 6 ? "Min 6 characters" : null),
                    const SizedBox(height: 15),
                    _buildTextField(controller: _confirmPassword, label: "Confirm Password", icon: Icons.lock_outline, obscure: true, validator: (val) => val != _password.text ? "Passwords do not match" : null),
                    const SizedBox(height: 30),
                    state is SignUpLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignUpBloc>().add(
                                      SignUpSubmittedEvent(
                                        email: _email.text.trim(),
                                        password: _password.text.trim(),
                                        name: _name.text.trim(),
                                        phone: _phone.text.trim(),
                                      ),
                                    );
                              }
                            },
                            child: const Text("Register", style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
