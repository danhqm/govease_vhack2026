import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the file you just made

void main() {
  runApp(const InclusiveCitizenApp());
}

class InclusiveCitizenApp extends StatelessWidget {
  const InclusiveCitizenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CivicBridge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Hides the ugly 'Debug' banner for your demo
      home: SplashScreen(), // This tells the app to start here!
    );
  }
}