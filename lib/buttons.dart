import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  //const Buttons({Key? key}) : super(key: key);
  final color;
  final textColor;
  final String buttonText;
  final buttonTaped;
  Buttons({this.color, this.textColor, required this.buttonText, this.buttonTaped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTaped,
      child: Padding(

        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttonText,
              style: TextStyle(color: textColor, fontSize: 20),),
            ),
          ),
        ),

      ),
    );
  }
}
