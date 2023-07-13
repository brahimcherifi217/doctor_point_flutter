// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/color.dart';

class CardButton extends StatelessWidget {
   CardButton({
    super.key,
    required this.cardSubTitle,
    required this.cardTitle,
    required this.img,
    required this.onTap
  });
  String img;
  String cardTitle;
  String cardSubTitle;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 20.0, right: 20, top: 20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                color: AppColors.mainColor.withOpacity(0.3),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 80,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffB1B2B5),
                    spreadRadius: 0,
                    blurRadius: 19,
                    offset: Offset(-4, 6), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  right: 10,
                  left: 15,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     cardTitle,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                    cardSubTitle,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
