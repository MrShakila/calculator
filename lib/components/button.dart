import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final Color textColor;
  final buttonTapped;
  const MyButton(
      {Key? key,
      required this.color,
      required this.buttonText,
      required this.textColor, this.buttonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              )),
            )),
      ),
    );
  }
}
