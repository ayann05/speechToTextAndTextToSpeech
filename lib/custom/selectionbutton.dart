import 'package:flutter/material.dart';

final ButtonStyle selectionBtn = ElevatedButton.styleFrom(
  minimumSize: Size(327, 50),
  shadowColor: Colors.grey,
  elevation: 15,
  primary: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);
