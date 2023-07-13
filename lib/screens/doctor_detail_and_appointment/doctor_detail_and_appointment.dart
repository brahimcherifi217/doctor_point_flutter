// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable, unused_field, unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison

import 'package:doctor_point/components/color.dart';
import 'package:doctor_point/model/appointment.dart';

import 'package:doctor_point/widgets/buttonAction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/header_doctor_detail_and_appointment.dart';

class DoctorDetailAndAppointment extends StatefulWidget {
  const DoctorDetailAndAppointment({super.key});

  @override
  State<DoctorDetailAndAppointment> createState() =>
      _DoctorDetailAndAppointmentState();
}

class _DoctorDetailAndAppointmentState
    extends State<DoctorDetailAndAppointment> {
  @override
  Widget build(BuildContext context) {
    int selectedDay = 0;
    List<Appointment> Data = [
      Appointment(
        day: "Thu 13",
        selected: false,
        morning: [
          "09 : 00",
          "10 : 00",
          "11 : 00",
          " 12 : 00",
        ],
        evening: [
          "13 : 00",
          "14 : 00",
          "15 : 00",
          "16 : 00",
        ],
      ),
      Appointment(
        day: "Fri 14",
        morning: [
          "13 : 00",
          "14 : 00",
          "15 : 00",
          "16 : 00",
        ],
        evening: [
          "13 : 00",
          "14 : 00",
          "15 : 00",
          "16 : 00",
        ],
      ),
      Appointment(
        day: "Sun 15",
        morning: [
          "09 : 00",
          "10 : 00",
          "15 : 00",
        ],
        evening: [
          "24 : 00",
          "14 : 00",
          "15 : 00",
          "16 : 00",
        ],
      ),
      Appointment(
        day: "Sut 16",
        morning: [
          "09 : 00",
          "10 : 00",
          "15 : 00",
        ],
        evening: [
          "13 : 00",
          "14 : 00",
          "15 : 00",
          "16 : 00",
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderDoctorDetailAndAppointment(),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 25),
              child: Text(
                "Make an Appointment",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 25),
                  child: Text(
                    "Select a date ",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: Data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedDay = index;
                                });
                              },
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffB1B2B5),
                                      spreadRadius: 0,
                                      blurRadius: 19,
                                      offset: Offset(
                                        -4,
                                        6,
                                      ), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(Data[index].day!),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 25),
                  child: Text(
                    "Morning",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: Data[selectedDay].morning!.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffB1B2B5),
                                  spreadRadius: 0,
                                  blurRadius: 19,
                                  offset: Offset(
                                      -4, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.alarm_sharp),
                                Text(
                                  Data[selectedDay].morning![i],
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 25),
                  child: Text(
                    "Evening",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: selectedDay == null
                      ? Center(
                          child: Text(
                              'Please select a date to see doctor availability'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Data[selectedDay].evening!.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xffB1B2B5),
                                        spreadRadius: 0,
                                        blurRadius: 19,
                                        offset: Offset(-4,
                                            6), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.alarm_sharp),
                                      Text(
                                        Data[selectedDay].evening![i],
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Center(
                    child: ButtonActionBook(
                      text: "Book",
                      buttonColor: AppColors.mainColor,
                      textColor: Colors.white,
                      onTap: () {},
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
