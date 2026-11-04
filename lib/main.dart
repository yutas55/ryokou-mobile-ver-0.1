import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const RentalMotorApp());
}

class RentalMotorApp extends StatelessWidget {
  const RentalMotorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rental Motor',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      ),
      home: HomeScreen(),
    );
  }
}
