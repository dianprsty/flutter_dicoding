import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/screen/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade800)),
      home: const LoginScreen(),
    );
  }
}
