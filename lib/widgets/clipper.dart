// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';



class Clip extends StatelessWidget {
  Clip({super.key, required this.assetname, required this.place});
  String assetname;
  Alignment place;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: place,
      child: Image.asset(assetname),
    );
  }
}
