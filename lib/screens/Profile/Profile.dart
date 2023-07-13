// ignore_for_file: file_names

import 'package:doctor_point/components/color.dart';
import 'package:doctor_point/screens/authScreen.dart';
import 'package:doctor_point/services/shared_services.dart';
import 'package:doctor_point/widgets/buttonAction.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonAction(
              text: "Logout",
              buttonColor: AppColors.mainColor,
              textColor: Colors.white,
              onTap: () {
                SharedServices.logOut(context).then(
                  (value) => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const AuthScreen()),
                    (Route<dynamic> route) => false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

//  Widget userDetail() {
//    return FutureBuilder(
//      future: ApiServices.getUserDetail(),
//      builder: (BuildContext context, AsyncSnapshot<String> model) {
//        if (model.hasData) {
//          return Text(model.data!);
//        }
//        return const CircularProgressIndicator();
//      },
//    );
}
