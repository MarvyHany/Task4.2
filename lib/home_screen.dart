import 'package:flutter/material.dart';
import 'login_screen.dart'; // تأكدي من المسار حسب مكان الملف

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = ['الحضور', 'الدروس', 'الدرجات', 'الرسائل'];

  final List<Widget> _pages = [
    Center(child: Text('محتوى الحضور')),
    Center(child: Text('محتوى الدروس')),
    Center(child: Text('محتوى الدرجات')),
    Center(child: Text('محتوى الرسائل')),
  ];

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد'),
        content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('لا'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text('نعم'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required int index,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: _selectedIndex == index ? Colors.white : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _onSelect(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Icon(
                  index == 0
                      ? Icons.check_circle
                      : index == 1
                          ? Icons.book
                          : index == 2
                              ? Icons.star
                              : Icons.message,
                  color: _selectedIndex == index
                      ? const Color(0xff1380A5)
                      : Colors.white,
                ),
                const SizedBox(width: 12),
                DefaultTextStyle(
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? const Color(0xff1380A5)
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // القائمة الجانبية
            Container(
              width: 240,
              color: const Color(0xff1380A5),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Color(0xff1380A5)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Marvy Hany Youssef',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 30),

                  // العناصر الفردية
                  _buildMenuItem(index: 0, child: const Text('الحضور')),
                  _buildMenuItem(index: 1, child: const Text('الدروس')),
                  _buildMenuItem(index: 2, child: const Text('الدرجات')),
                  _buildMenuItem(index: 3, child: const Text('الرسائل')),

                  const Spacer(),

                  // زر تسجيل الخروج
                  ElevatedButton.icon(
                    onPressed: _logout,
                    icon: const Icon(Icons.logout),
                    label: const Text('تسجيل الخروج'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xff1380A5),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // المحتوى
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: Center(child: _pages[_selectedIndex]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
