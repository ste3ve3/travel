import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/cubits/app_cubit_states.dart';
import 'package:travellapp/cubits/app_cubits.dart';
import 'package:travellapp/theme/colors.dart';
import 'package:travellapp/widgets/app_button.dart';
import 'package:travellapp/widgets/app_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
        if(state is DetailsState) {
        var details = state.place;
        return Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 350,
              left: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/${details.img}"),
                    fit: BoxFit.cover
                  )
                ),
              ), 
            ),
            Positioned(
              left: 10,
              top: 30,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<AppCubits>(context).backToHome();
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
            Positioned(
              left: 0,
              top: 270,
              right: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 650,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Container(
                  margin: const EdgeInsets.only(right: 25, left: 25, top: 30, bottom: 90),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: details.name.length > 15 ? "${details.name.substring(0, 13)}..." : details.name, size: 24, weight: FontWeight.w600),
                            AppText(text: '\$${details.price}', size: 24, weight: FontWeight.w600, color: AppColors.mainColor,),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 25, color: AppColors.mainColor,),
                            const SizedBox(width: 4,),
                            AppText(text: details.location, size: 13, weight: FontWeight.normal, color: AppColors.mainColor,),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            SizedBox(
                              width: 180,
                              height: 50,
                              child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const Icon(Icons.star, size: 25, color: AppColors.starColor,);
                              },
                              separatorBuilder: (context, index) => const SizedBox(width: 8,),
                              itemCount: 5,
                            ),
                            ),
                            const SizedBox(width: 4,),
                            AppText(text: '(4.0)', size: 13, weight: FontWeight.normal, color: AppColors.textColor2,),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        AppText(text: "People", size: 16),
                        const SizedBox(height: 5,),
                        AppText(text: "Number of people in your group", size: 13, weight: FontWeight.normal,),
                        const SizedBox(height: 5,),
                        Wrap(
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10, top: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: currentIndex == index ? Colors.black : AppColors.buttonBackground,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: AppText(text: '${index + 1}', size: 16, weight: FontWeight.w600, color: currentIndex == index ? Colors.white : Colors.black,),
                                ),
                              ),
                            );
                          })
                        ),
                        const SizedBox(height: 20,),
                        AppText(text: "Description", size: 16),
                        const SizedBox(height: 5,),
                        AppText(
                          text: details.description, 
                          size: 13, weight: 
                          FontWeight.normal,
                        ),
                      ]
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 15,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, 
                      spreadRadius: 25, 
                      blurRadius: 10, 
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textColor2),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Icon(Icons.favorite_border, size: 25, color: AppColors.textColor2,),
                      ),
                    ),
                    AppButton(hasText: true, text: 'Book Now', width: 250,)
                  ],
                ),
              ),
            ),
          ],
          );
        }
        return Container();
        }
      )
      );
  }
}