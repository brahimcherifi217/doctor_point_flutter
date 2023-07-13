// ignore_for_file: must_be_immutable

import 'package:doctor_point/components/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatTitle extends StatelessWidget {
  CatTitle({super.key, required this.title, required this.onTap});
  String title;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0, left: 20, right: 20, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:  GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          InkWell(
            onTap: onTap,
            child:  Text(
              "More",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.mainColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
