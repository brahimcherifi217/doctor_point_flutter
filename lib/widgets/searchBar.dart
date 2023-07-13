// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/color.dart';

class SearchBarCost extends StatelessWidget {
   SearchBarCost({
    super.key,
    required this.hintText,
     this.onTapSearchButton,
     this.onSaved
  });
  String hintText;
  void Function()? onTapSearchButton;
  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size ;
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.814,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: size.width * 0.66,
              height: size.height * 0.039,
              child: TextFormField(
                onSaved: onSaved,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  
                  labelText: hintText,
                  labelStyle: GoogleFonts.poppins(
                      color:
                          AppColors.mainColor.withOpacity(0.5)),
                  floatingLabelStyle:
                      const TextStyle(color: Colors.transparent),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onTapSearchButton,
            child: Container(
              height: size.height * 0.0395,
              width: size.width * 0.101,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.mainColor,
                    AppColors.secondColor,
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
