// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  GoBackButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.onTap});
  IconData icon;
  Color color;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        size: 65,
        color: color,
      ),
    );
  }
}
