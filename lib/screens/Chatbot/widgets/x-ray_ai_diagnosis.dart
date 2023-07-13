// ignore_for_file: prefer_const_constructors, file_names, unused_field, avoid_print, must_be_immutable
import 'dart:io';
import 'package:doctor_point/components/color.dart';
import 'package:doctor_point/screens/categories/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../components/x_ray_result.dart';

class XRayAiDiagnosis extends StatefulWidget {
  const XRayAiDiagnosis({super.key});

  @override
  State<XRayAiDiagnosis> createState() => _XRayAiDiagnosisState();
}

class _XRayAiDiagnosisState extends State<XRayAiDiagnosis> {
  List? output;
  bool loading = false;
  File? image;
  String? label;
  @override
  void initState() {
    super.initState();
    loading = true;

    loadModel().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          "X - Ray AI Diagnosis",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            if (image == null)
              InkWell(
                onTap: getImage,
                child: Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Please Pick your X-Ray picture",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            else
              InkWell(
                onTap: getImage,
                child: Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your result",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            if (label.toString() == "1 normal")
              XRayResult(
                advice:
                    "You can take several steps to make breathing easier and slow the progression of the disease: Quit smoking. Take prescribed medications as directed by your provider. Ask your doctor about a pulmonary rehabilitation program, which teaches you how to be active with less shortness of breath.",
                status: "Pulmonary disease",
                statusColor: Colors.red,
                btnColor: AppColors.mainColor,
                btnTextColor: Colors.white,
                btnTitle: "Find a Specialist ",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Categories();
                      },
                    ),
                  );
                },
              )
            else if (label.toString() == "0 pulmonary_disease")
              XRayResult(
                advice:
                    "In order to be truly healthy, one must eat well, sleep on time and wake up early. Staying fit by exercising daily also helps to keep one's health in proper check. If you are in good health, you can always work to attain more wealth. But if one is not healthy, then wealth is of no importance.",
                status: "Healthy Person",
                statusColor: Colors.green,
                btnColor: AppColors.mainColor,
                btnTextColor: Colors.white,
                btnTitle: "More Advices",
                onTap: () {},
              )
            else
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  "Your result will generated here",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imagePath = File(image.path);
    setState(() {
      this.image = imagePath;
    });
    classifyImage(imagePath);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      loading = false;
      output = output;
      label = output![0]['label'];
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite/model_unquant.tflite",
      labels: "assets/tflite/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}


