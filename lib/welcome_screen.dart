import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '/app_colors.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
         
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                
                const Text(
                  'مرحباً بك!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'دعنا نبدأ رحلتنا سوياً\nسجّل الدخول أو أنشئ حساب جديد.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 40),

             
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'إنشاء حساب جديد',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}