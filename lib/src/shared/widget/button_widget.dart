import 'dart:ffi';

import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String title;

  final Function() onPressed;

  const ButtonWidget({super.key, required this.title, required this.onPressed});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(231, 101, 8, 0.9)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: const TextStyle(
          fontFamily: 'Dongle',
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
