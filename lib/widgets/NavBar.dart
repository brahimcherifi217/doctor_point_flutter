// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_field, file_names

import 'package:doctor_point/screens/Chatbot/chat_bot.dart';
import 'package:doctor_point/screens/EHR/electronic_health_record.dart';
import 'package:doctor_point/screens/Home/home.dart';
import 'package:doctor_point/screens/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../components/color.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
 static  List screens = [
  HomePage(),
  ChatBot(),
  ElectronicHealthRecord(),
  Profile()
 ];
 int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 8, right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
              colors: [
                AppColors.mainColor,
                AppColors.secondColor,
              ],
            ),
          ),
          child: GNav(
            gap: 8,
            tabs: const [
              GButton(
                icon: LineAwesomeIcons.home,
                iconColor: Colors.white,
                textColor: Colors.white,
                iconActiveColor: Colors.white,
                text: "Home",
              ),
              GButton(
                icon: Icons.chat_bubble_outline,
                iconColor: Colors.white,
                textColor: Colors.white,
                iconActiveColor: Colors.white,
                text: "Chatbot",
              ),
              GButton(
                icon: Icons.medical_information,
                iconColor: Colors.white,
                textColor: Colors.white,
                iconActiveColor: Colors.white,
                text: "EHR",
              ),
              GButton(
                icon: Icons.person,
                iconColor: Colors.white,
                textColor: Colors.white,
                iconActiveColor: Colors.white,
                text: "Profile",
              ),
            ],
           selectedIndex: selectedIndex,
           onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
           },
          ),
        ),
      ),
    );
  }
}


