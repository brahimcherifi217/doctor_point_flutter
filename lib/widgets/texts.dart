// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTitle extends StatelessWidget {
  InputTitle(
      {super.key, required this.text, required this.color, this.decoration});
  String text;
  Color color;
  TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
        decoration: decoration,
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  Subtitle(
      {super.key, required this.text, required this.color, this.decoration});
  String text;
  Color color;
  TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: color,
        decoration: decoration,
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  ScreenTitle({
    super.key,
    required this.title,
    required this.color,
    this.decoration,
  });
  String title;
  Color color;
  TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        color: color,
        decoration: decoration,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  ButtonText({
    super.key,
    required this.text,
    required this.color,
  });
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        color: color,
        fontSize: 18,
      ),
    );
  }
}
