import 'package:flutter/material.dart';

class MyPost1 extends StatefulWidget {
  const MyPost1({super.key});

  @override
  State<MyPost1> createState() => _MyPost1State();
}

class _MyPost1State extends State<MyPost1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.tealAccent,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Text(
                    "Text-to-speech (TTS) technology, the process of converting written text into spoken words, has undergone significant advancements, making it a crucial component in various applications. Modern text-to-speech systems support multiple languages and accents, making them useful for a diverse global audience. These systems often allow users to select from various voices and languages.TTS plays a crucial role in accessibility by enabling visually impaired individuals to access written content through speech output. Screen readers and assistive technologies often utilize TTS to read aloud text from computers and mobile devices.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
