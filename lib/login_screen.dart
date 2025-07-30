import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xff1380A5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'أهلاً بك نحن سعداء بعودتك\nمن فضلك قم بتسجيل الدخول',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'رقم الهاتف',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك أدخل رقم الهاتف';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'كلمة المرور',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك أدخل كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'هل نسيت كلمة المرور؟',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomeScreen(),
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
                            'تسجيل الدخول',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ليس لديك حساب؟ ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
