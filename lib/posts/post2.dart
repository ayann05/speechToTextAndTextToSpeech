import 'package:flutter/material.dart';

class MyPost2 extends StatefulWidget {
  const MyPost2({super.key});

  @override
  State<MyPost2> createState() => _MyPost2State();
}

class _MyPost2State extends State<MyPost2> {
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
                    "Speech-to-text technology, also known as automatic speech recognition (ASR), has made significant advancements over the years, enabling various applications and functionalities.Some speech-to-text systems can transcribe speech in real-time, allowing for live captioning during events, meetings, or broadcasts. This capability enhances accessibility and inclusivity.Modern speech-to-text systems support multiple languages, allowing users to transcribe speech in different languages accurately.",
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
