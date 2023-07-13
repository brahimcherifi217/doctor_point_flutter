// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/buttonAction.dart';


class XRayResult extends StatelessWidget {
  XRayResult({
    super.key,
    required this.advice,
    required this.status,
    required this.btnColor,
    required this.statusColor,
    required this.btnTextColor,
    required this.btnTitle,
    required this.onTap,
  });

  String status;
  String advice;
  String btnTitle;
  Color statusColor;
  Color btnColor;
  Color btnTextColor;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: statusColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              advice,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonAction(
                text: btnTitle,
                buttonColor: btnColor,
                textColor: btnTextColor,
                onTap: onTap,
              ),
            ),
          )
        ],
      ),
    );
  }
}