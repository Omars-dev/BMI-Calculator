import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF0A0D22),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0D22),
          ),
        ),
      home: const InputPage(),
    );
  }
}

