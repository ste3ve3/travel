import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/cubits/app_cubits.dart';
import 'package:travellapp/models/data_model.dart';
import 'package:travellapp/widgets/app_text.dart';

ListView placesItemsList(List<DataModel> places) {
  return ListView.separated(
    itemCount: places.length,
    separatorBuilder: (_, index) {
      return const SizedBox(width: 20,);
    },
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          BlocProvider.of<AppCubits>(context).getDetails(places[index]);  
        },
        child: Container(
          width: 220,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage("http://mark.bslmeiyu.com/uploads/${places[index].img}"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: places[index].name, color: Colors.white, size: 18, weight: FontWeight.normal,),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white,),
                    const SizedBox(width: 8,),
                    AppText(text: places[index].location.length > 20 ? "${places[index].location.substring(0, 20)}..." : places[index].location, color: Colors.white, size: 12, weight: FontWeight.normal,),
                  ],
                )
              ]),
            )),
        ),
      );
    },
  );
}