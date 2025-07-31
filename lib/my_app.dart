import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup_screen.dart';
import 'bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/login_screen.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: LoginScreenWithBloc(),
    );
  }
}



