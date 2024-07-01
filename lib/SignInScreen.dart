import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_app/SignUpScreen.dart';
import 'package:sos_app/HomePageScreen.dart'; // Import the HomePageScreen

class SignInScreen extends StatelessWidget {
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;
  const SignInScreen(
      {super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تسجيل الدخول',
            style: TextStyle(fontFamily: 'TajawalRegular'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/municipality.png',
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      labelStyle:
                          TextStyle(fontFamily: 'TajawalRegular', fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        labelStyle: TextStyle(
                            fontFamily: 'TajawalRegular', fontSize: 14)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePageScreen(
                              toggleDarkMode: toggleDarkMode,
                              isDarkMode: isDarkMode),
                        ),
                      );
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontFamily: 'AAGALAXYsolid'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'ليس لديك حساب؟ سجل الآن',
                      style: TextStyle(fontFamily: 'AAGALAXYsolid'),
                    ),
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
