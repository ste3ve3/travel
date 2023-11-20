import 'package:flutter/material.dart';
import 'package:travellapp/models/emotions_model.dart';
import 'package:travellapp/widgets/app_text.dart';

ListView emotionsItemsList(List<EmotionsModel> places) {
  return ListView.separated(
    itemCount: places.length,
    separatorBuilder: (_, index) {
      return const SizedBox(width: 20,);
    },
    scrollDirection: Axis.horizontal,
    itemBuilder: (_, index) {
      return Container(
        width: 220,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(places[index].image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: places[index].title, color: Colors.white, size: 18, weight: FontWeight.normal,),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white,),
                  const SizedBox(width: 8,),
                  AppText(text: places[index].location, color: Colors.white, size: 12, weight: FontWeight.normal,),
                ],
              )
            ]),
          )),
      );
    },
  );
}