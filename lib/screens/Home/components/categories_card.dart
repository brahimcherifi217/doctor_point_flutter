// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatCard extends StatelessWidget {
  CatCard(
      {super.key,
      required this.onTap,
      required this.name,
      required this.imagePath,
      required this.boxColor});
  void Function() onTap;
  String name;
  String imagePath;
  Color boxColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 5, top: 8),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 120,
          width: 120,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style:  GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff837A7A),
                          ),
                        ),
                        const Text(
                          'Specialist',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff837A7A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                    
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: boxColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
