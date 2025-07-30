import 'package:flutter/material.dart';
import '/app_colors.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 40,
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteApp,
      body: Stack(
        children: [
        
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.9),
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const Text(
                    'أدخل رمز التحقق OTP',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'لقد أرسلنا الكود الخاص بك إلى 010***000.\nسينتهي هذا الكود في 00:30',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, _buildOtpBox),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                         builder: (_) => const HomeScreen(),
                          ),
                         );
                        // التحقق من الكود
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.mainColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('تأكيد'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}