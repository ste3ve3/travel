import 'package:flutter/material.dart';
import 'package:travellapp/theme/colors.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  double width;
  final String text;
  bool hasText;
  AppButton({
    Key? key, 
    this.width = 100,
    this.text = "",  
    required this.hasText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      // padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: hasText ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
        children: [
          Visibility(
            visible: hasText,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Image.asset('assets/button-one.png',),
        ],
      ),
    );
  }
}

