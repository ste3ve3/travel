import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/cubits/app_cubit_states.dart';
import 'package:travellapp/cubits/app_cubits.dart';
import 'package:travellapp/details_page.dart';
import 'package:travellapp/home_page.dart';
import 'package:travellapp/welcome.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const Welcome();
          } 
          else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } 
          else if (state is LoadedState) {
            return const HomePage();
          }
          else if (state is DetailsState) {
            return const DetailsPage();
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}