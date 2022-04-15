import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 2),
    );
  }
}

// class RotateText extends StatelessWidget {
//    RotateText({ Key? key, required this.text }) : super(key: key);
// String text;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       ,
//     );
//   }
// }