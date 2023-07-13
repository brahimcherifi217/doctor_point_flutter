// ignore_for_file: must_be_immutable, void_checks

import 'package:doctor_point/components/color.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({
    super.key,
    required this.hintText,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.controller,
    this.onTap,
  });

  String hintText;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  TextEditingController? controller;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.797,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Center(
          child: TextFormField(
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            onTap: onTap,
            onSaved: onSaved,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor, width: 15),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              labelText: hintText,
              floatingLabelStyle:
                  const TextStyle(color: Colors.black, fontSize: 0),
              labelStyle: const TextStyle(
                color: Colors.black26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GrandTextInput extends StatelessWidget {
  GrandTextInput(
      {super.key, required this.hintText, this.onSaved, this.validator});
  String hintText;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        width: size.width * 0.797,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff2661DF)),
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(
            child: TextFormField(
              onSaved: onSaved,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: hintText,
                floatingLabelStyle: const TextStyle(
                  color: Colors.transparent,
                ),
                labelStyle: const TextStyle(color: Colors.black26),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
