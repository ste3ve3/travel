import 'package:flutter/material.dart';
import 'package:travellapp/theme/colors.dart';

class ExploreModel {
  Color color;
  String text;
  String image;

  ExploreModel({
    required this.color,
    required this.text,
    required this.image,
  });
  
  static List<ExploreModel> getExploreOptions() {
    List<ExploreModel> options = [];
    
    options.add(
      ExploreModel(
        color: AppColors.mainColor,
        text: 'Kayaking',
        image: 'assets/kayaking.png'
      )
    );

    options.add(
      ExploreModel(
        color: AppColors.starColor,
        text: 'Snorkeling',
        image: 'assets/snorkling.png'
      )
    );

    options.add(
      ExploreModel(
        color: AppColors.textColor1,
        text: 'Balloning',
        image: 'assets/balloning.png'
      )
    );

    options.add(
      ExploreModel(
        color: Colors.green,
        text: 'Hiking',
        image: 'assets/hiking.png'
      )
    );
  
    return options;
  }
}