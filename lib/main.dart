// ignore_for_file: unused_element

import 'package:doctor_point/components/color.dart';
import 'package:doctor_point/screens/authScreen.dart';
import 'package:doctor_point/services/shared_services.dart';
import 'package:doctor_point/widgets/NavBar.dart';
import 'package:flutter/material.dart';


Widget _defaultHome = const AuthScreen();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool result = await SharedServices.isLogedIn();
  if (result) {
    _defaultHome = const NavBar();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Doctor's Point",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: _defaultHome ,

    );
  }
}
