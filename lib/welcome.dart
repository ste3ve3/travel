import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/cubits/app_cubits.dart';
import 'package:travellapp/models/welcome_model.dart';
import 'package:travellapp/theme/colors.dart';
import 'package:travellapp/widgets/app_button.dart';
import 'package:travellapp/widgets/app_text.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List < WelcomeModel > slides = [];
  void _getSlides() {
    slides = WelcomeModel.getSlides();
  }
  @override
  Widget build(BuildContext context) {
    _getSlides();
    return Scaffold(
      body: PageView.builder(
        itemCount: slides.length,
        itemBuilder: (_, index) {
          return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(slides[index].bgImage),
              fit: BoxFit.cover,
            ),
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Container(
            margin: const EdgeInsets.only(top:100, left:20, right:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: slides[index].title),
                    AppText(text: slides[index].subTitle, weight: FontWeight.normal, size: 28,),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 254,
                      child: AppText(text: slides[index].description, weight: FontWeight.normal, color: AppColors.textColor2, size: 15,)
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).getData();
                      },
                      child: AppButton(hasText: false)
                    )
                  ],
                ),
                Column(
                  children: List.generate(3, (listIndex) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == listIndex ? 25 : 10,
                        decoration: BoxDecoration(
                          color: index == listIndex ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    })
                )
              ]),
          ),
        );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}