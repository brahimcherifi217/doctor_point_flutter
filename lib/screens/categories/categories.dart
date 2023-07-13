// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:doctor_point/components/color.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/searchBar.dart';
import '../Home/components/top_doctor_card.dart';
import '../doctor_detail_and_appointment/doctor_detail_and_appointment.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        leadingWidth: 35,
        title: Text(
          "Heart Specialist",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 0,
            floating: false,
            backgroundColor: AppColors.mainColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            scrolledUnderElevation: 0,
            title: Container(
              height: 60,
              width: 380,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Center(
                child: SearchBarCost(
                  hintText: "Search Doctor",
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            expandedHeight: 50,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile1.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist ",
                        doctorRate: 4.3,
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
                        cardColor: AppColors.secondColor.withOpacity(0.20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile2.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.mainColor.withOpacity(0.22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile1.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.thirdColor.withOpacity(0.22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile2.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.secondColor.withOpacity(0.22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile3.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.mainColor.withOpacity(0.22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile3.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.secondColor.withOpacity(0.22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile3.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.thirdColor.withOpacity(0.22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile3.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.mainColor.withOpacity(0.22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TopDoctorCard(
                        doctorImage: "assets/img/profile3.png",
                        doctorName: "Dr. David Jackson",
                        doctorSpecialist: "Heart Specialist ",
                        doctorRate: 4.3,
                        onTap: () {},
                        cardColor: AppColors.secondColor.withOpacity(0.18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
