import 'package:flutter/material.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xff1380A5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),


                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'الاسم الكامل',
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك أدخل الاسم';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),


                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'من فضلك أدخل بريد إلكتروني صحيح';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),


                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'رقم الموبايل ',
                      prefixIcon: const Icon(Icons.phone),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.length < 10) {
                        return 'من فضلك أدخل رقم صحيح';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),


                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OtpScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xff1380A5),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'لديك حساب بالفعل؟',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}