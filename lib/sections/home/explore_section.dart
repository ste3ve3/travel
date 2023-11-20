import 'package:flutter/material.dart';
import 'package:travellapp/models/explore_model.dart';
import 'package:travellapp/theme/colors.dart';
import 'package:travellapp/widgets/app_text.dart';

List<ExploreModel> exploreOptions = [];

  void _getOptions() {
    exploreOptions = ExploreModel.getExploreOptions();
  }
  
  Column exploreSection() {
    _getOptions();
      return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(text: "Explore more", size: 22,),
                AppText(text: "see all", size: 14, weight: FontWeight.normal, color: AppColors.mainColor,),
              ],
            ),
            const SizedBox(height: 14,),
            SizedBox(
              height: 120,
              width: double.maxFinite,
              child: ListView.separated(
                itemCount: exploreOptions.length,
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 20,);
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: exploreOptions[index].color.withOpacity(0.1),
                        ),
                        child: Image.asset(exploreOptions[index].image),
                      ),
                      const SizedBox(height: 5,),
                      AppText(text: exploreOptions[index].text, size: 13, weight: FontWeight.normal, color: Colors.grey,)
                    ],
                  );
                },
              ),
            )
          ],
        );
    }