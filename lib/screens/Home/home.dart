// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:doctor_point/components/color.dart';
import 'package:doctor_point/screens/categories/categories.dart';
import 'package:doctor_point/screens/doctor_detail_and_appointment/doctor_detail_and_appointment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/header.dart';
import 'components/title.dart';
import 'components/categories_card.dart';
import 'components/top_doctor_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(
              Icons.notifications,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          "DOCTOR'S POINT",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //bottomNavigationBar: NavBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            CatTitle(
              title: "Categories",
              onTap: () {},
            ),
            Container(
              color: Colors.white,
              height: 121,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CatCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Categories();
                          },
                        ),
                      );
                    },
                    name: "Heart",
                    imagePath: "assets/img/heart.png",
                    boxColor: AppColors.secondColor,
                  ),
                  CatCard(
                    onTap: () {},
                    name: 'Brain',
                    imagePath: 'assets/img/brain.png',
                    boxColor: AppColors.thirdColor,
                  ),
                  CatCard(
                    onTap: () {},
                    name: "Eye",
                    imagePath: "assets/img/eye.png",
                    boxColor: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            CatTitle(title: "Top Doctor's", onTap: () {}),

            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: TopDoctorCard(
                doctorImage: "assets/img/profile1.png",
                doctorName: "Dr. Margaret Wilson",
                doctorSpecialist: "Heart Specialist ",
                doctorRate: 3.7,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DoctorDetailAndAppointment();
                      },
                    ),
                  );
                },
                cardColor: AppColors.thirdColor.withOpacity(0.11),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: TopDoctorCard(
                doctorImage: "assets/img/profile3.png",
                doctorName: "Dr. David Jackson",
                doctorSpecialist: "Brain Specialist ",
                doctorRate: 4.3,
                onTap: () {},
                cardColor: AppColors.secondColor.withOpacity(0.11),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: TopDoctorCard(
                doctorImage: "assets/img/profile2.png",
                doctorName: "Dr. Selma Afumba",
                doctorSpecialist: "Eye Specialist ",
                doctorRate: 4.5,
                onTap: () {},
                cardColor: AppColors.mainColor.withOpacity(0.11),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

