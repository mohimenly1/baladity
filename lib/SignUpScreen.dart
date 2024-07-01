import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'الإنظمام',
            style: TextStyle(fontFamily: 'AAGALAXYsolid'),
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
                    'assets/img/signup.png',
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      labelStyle: TextStyle(fontFamily: 'LAXR', fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        labelStyle:
                            TextStyle(fontFamily: 'LAXR', fontSize: 14)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'تأكيد كلمة المرور',
                        labelStyle:
                            TextStyle(fontFamily: 'LAXR', fontSize: 14)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle sign in logic here
                    },
                    child: const Text(
                      'الإنظمام',
                      style: TextStyle(fontFamily: 'AAGALAXYsolid'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
