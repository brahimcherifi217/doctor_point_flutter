// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/color.dart';

class TopDoctorCard extends StatelessWidget {
  TopDoctorCard(
      {super.key,
      required this.doctorImage,
      required this.doctorName,
      required this.doctorRate,
      required this.doctorSpecialist,
      required this.cardColor,
      required this.onTap});
  String doctorImage;
  String doctorName;
  double doctorRate;
  String doctorSpecialist;
  Color cardColor;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: cardColor),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.11),
                  shape: BoxShape.circle,
                ),
                child: Center(child: Image.asset(doctorImage)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    doctorName,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        doctorSpecialist,
                        style:  GoogleFonts.poppins(
                          fontSize: 15,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              doctorRate.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
