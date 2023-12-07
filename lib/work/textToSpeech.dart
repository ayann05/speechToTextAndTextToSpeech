/*using a predifined text that is being provided in the TTS_INPUT

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ttsandstt/const/const.dart';

class textToSpeech extends StatefulWidget {
  const textToSpeech({super.key});

  @override
  State<textToSpeech> createState() => _textToSpeechState();
}

class _textToSpeechState extends State<textToSpeech> {
  FlutterTts _flutterTts = FlutterTts();
  Map? _currentVoice;
  List<Map> _voices = [];

  int? _currentWordStart, _currentWordEnd;

  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() async {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
      });
    });
    _flutterTts.getVoices.then((data) {
      try {
        _voices = List<Map>.from(data);

        print(
            _voices); //to check in debug console whether the voices are being shown in the list or not
        setState(() {
          //selected only english voice
          _voices =
              _voices.where((_voice) => _voice["name"].contains("en")).toList();
          //by this we will now store the actual reference of the current voice that we are going to be using
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  //the voice that is to be used
  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Text to Speech",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
              ),
              child: DropdownButton(
                  elevation: 12,
                  autofocus: true,
                  borderRadius: BorderRadius.circular(18),
                  iconDisabledColor: Colors.greenAccent,
                  iconEnabledColor: Colors.red,
                  focusColor: Colors.white,
                  value: _currentVoice,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  items: _voices
                      .map(
                        (_voice) => DropdownMenuItem(
                          value: _voice,
                          child: Text(_voice["name"]),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {}),
            ),
            RichText(
              //a Rich Text widget allow us to implement other text spans within
              //it and for each text span within it it can define the styling that we want to have fot the text span
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: TTS_INPUT.substring(0, _currentWordStart),
                  ),
                  if (_currentWordStart != null)
                    TextSpan(
                      text: TTS_INPUT.substring(
                        _currentWordStart!,
                        _currentWordEnd,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  if (_currentWordEnd != null)
                    TextSpan(
                      text: TTS_INPUT.substring(_currentWordEnd!),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _flutterTts.speak(TTS_INPUT);
        },
        child: const Icon(
          CupertinoIcons.speaker,
        ),
      ),
    );
  }
} 

*/

//taking user input and speak the particular that is being inserted

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  FlutterTts _flutterTts = FlutterTts();
  Map? _currentVoice;
  List<Map> _voices = [];
  TextEditingController _textEditingController = TextEditingController();

  int? _currentWordStart, _currentWordEnd;

  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() async {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
      });
    });
    _flutterTts.getVoices.then((data) {
      try {
        _voices = List<Map>.from(data);
        setState(() {
          //selected only english voice
          _voices =
              _voices.where((_voice) => _voice["name"].contains("en")).toList();
          //by this we will now store the actual reference of the current voice that we are going to be using
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  //the voice that is to be used
  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Text to Speech",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: "Enter text",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
              ),
              child: DropdownButton(
                elevation: 12,
                autofocus: true,
                borderRadius: BorderRadius.circular(18),
                iconDisabledColor: Colors.greenAccent,
                iconEnabledColor: Colors.red,
                focusColor: Colors.white,
                value: _currentVoice,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                items: _voices
                    .map(
                      (_voice) => DropdownMenuItem(
                        value: _voice,
                        child: Text(_voice["name"]),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            RichText(
              //a Rich Text widget allow us to implement other text spans within
              //it and for each text span within it it can define the styling that we want to have fot the text span
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 20, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: _textEditingController.text
                        .substring(0, _currentWordStart ?? 0),
                  ),
                  if (_currentWordStart != null)
                    TextSpan(
                      text: _textEditingController.text.substring(
                        _currentWordStart!,
                        _currentWordEnd,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  if (_currentWordEnd != null)
                    TextSpan(
                      text: _textEditingController.text
                          .substring(_currentWordEnd!),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _flutterTts.speak(_textEditingController.text);
        },
        child: const Icon(
          CupertinoIcons.speaker,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
