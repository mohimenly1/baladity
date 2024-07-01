import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي',
            style: TextStyle(fontFamily: 'TajawalRegular')),
      ),
      body: Center(
        child: Text(
          'Profile Screen Content',
          style: TextStyle(fontSize: 24, fontFamily: 'TajawalRegular'),
        ),
      ),
    );
  }
}
