import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_app/SignInScreen.dart';

class IntroScreen extends StatefulWidget {
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;

  const IntroScreen(
      {super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          buildPage(
            context,
            'مرحباً بالمواطن الكريم',
            'الأن بلديتك أقرب، لا تتردد في التواصل معنا',
            'assets/img/municipality.png',
          ),
          buildPage(
            context,
            'بلديتك هي بيتك',
            'حافظ على جمال بيتك، كن مواطناً يساهم في استقرار الحياة',
            'assets/img/government.png',
          ),
          buildPage(
            context,
            'الامان ضرورة إنسانية',
            'نحقق الأمان من خلال تكاثف وإستمرار جهود التواصل.',
            'assets/img/police.jpg',
            onFinish: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('seenIntro', true);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignInScreen(
                    toggleDarkMode: widget.toggleDarkMode,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      BuildContext context, String title, String description, String imagePath,
      {VoidCallback? onFinish}) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 300),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'TajawalRegular'),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16, fontFamily: 'TajawalRegular'),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          onFinish != null
              ? ElevatedButton(
                  onPressed: onFinish,
                  child: const Text(
                    'إنظمام',
                    style:
                        TextStyle(fontFamily: 'TajawalRegular', fontSize: 25),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
