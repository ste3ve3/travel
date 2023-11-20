import 'package:flutter/material.dart';

AppBar homeAppBar() {
  return AppBar(
    leading: const Icon(Icons.menu),
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: const DecorationImage(
            image: AssetImage('assets/mountain.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
