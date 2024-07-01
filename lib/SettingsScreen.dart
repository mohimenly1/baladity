import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;

  const SettingsScreen(
      {super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('الإعدادات',
              style: TextStyle(fontFamily: 'TajawalRegular')),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الإعدادات العامة',
                    style:
                        TextStyle(fontSize: 24, fontFamily: 'TajawalRegular')),
                SwitchListTile(
                  title: const Text('الوضع المظلم',
                      style: TextStyle(fontFamily: 'TajawalRegular')),
                  value: isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      isDarkMode = value;
                    });
                    widget.toggleDarkMode(value);
                  },
                ),
                // Add more settings here
              ],
            ),
          ),
        ));
  }
}
