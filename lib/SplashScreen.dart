import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:sos_app/IntroScreen.dart';
import 'package:sos_app/SignInScreen.dart';

class SplashScreen extends StatelessWidget {
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;
  const SplashScreen(
      {super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? seenIntro = prefs.getBool('seenIntro') ?? false;
      if (seenIntro) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignInScreen(
              toggleDarkMode: toggleDarkMode,
              isDarkMode: isDarkMode,
            ),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => IntroScreen(
                    toggleDarkMode: toggleDarkMode,
                    isDarkMode: isDarkMode,
                  )),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'بلــدتــي',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ALJAZEERALIGHT'),
            ),
            SizedBox(height: 20),
            Text(
              'مساعدة البلديات والمواطنين على الإبلاغ عن الأنشطة غير القانونية.',
              style: TextStyle(fontFamily: 'TajawalRegular'),
            ),
          ],
        ),
      ),
    );
  }
}
