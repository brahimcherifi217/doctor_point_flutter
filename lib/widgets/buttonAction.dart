// ignore_for_file: must_be_immutable, file_names

import 'package:doctor_point/widgets/texts.dart';
import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  ButtonAction(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      required this.onTap});
  String text;
  Color textColor;
  Color buttonColor;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.046,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: ButtonText(
            text: text,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class ButtonActionBook extends StatelessWidget {
  ButtonActionBook(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      required this.onTap});
  String text;
  Color textColor;
  Color buttonColor;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.046,
        //width: size.width * 0.45,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: ButtonText(
            text: text,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
