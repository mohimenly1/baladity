// CivilScreen.dart
import 'package:flutter/material.dart';

class CivilScreen extends StatelessWidget {
  const CivilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قرارات',
            style: TextStyle(fontFamily: 'TajawalRegular')),
      ),
      body: Center(
        child: Text(
          'Report a Legislation issue',
          style: const TextStyle(fontSize: 24, fontFamily: 'TajawalRegular'),
        ),
      ),
    );
  }
}

// Repeat similar structure for other categories
