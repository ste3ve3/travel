import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontWeight weight;
  AppText({
    Key? key, 
    this.size = 30,
    required this.text, 
    this.color = Colors.black, 
    this.weight = FontWeight.bold,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}

