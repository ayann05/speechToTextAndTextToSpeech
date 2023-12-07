import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ttsandstt/splash/splashscreen.dart';

void main() {
  runApp(ttsandstt());
}

class ttsandstt extends StatefulWidget {
  const ttsandstt({super.key});

  @override
  State<ttsandstt> createState() => _ttsandsttState();
}

class _ttsandsttState extends State<ttsandstt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryTextTheme: GoogleFonts.ralewayTextTheme(),
      ),
      routes: {
        '/': (context) => const splash(),
      },
    );
  }
}
