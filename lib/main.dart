import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/cubits/app_cubit_logics.dart';
import 'package:travellapp/cubits/app_cubits.dart';
import 'package:travellapp/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices()
        ),
        child: const AppCubitLogics(),
      )
    );
  }
}
