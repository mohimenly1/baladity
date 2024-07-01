import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SplashScreen.dart';
import 'HomePageScreen.dart';
import 'ProfileScreen.dart';
import 'SettingsScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;

  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;

  const MyApp({super.key, required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
    saveDarkModePreference(value);
  }

  void saveDarkModePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'بلدتي',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home:
          SplashScreen(toggleDarkMode: toggleDarkMode, isDarkMode: isDarkMode),
    );
  }
}
