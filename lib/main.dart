import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_game/views/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        textTheme: TextTheme(
            titleLarge: GoogleFonts.jua(fontSize: 64),
            labelLarge: GoogleFonts.jua(fontSize: 50),
            headlineMedium: GoogleFonts.jua(
              fontSize: 30,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }
}
