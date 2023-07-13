// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:doctor_point/screens/Chatbot/components/card_button.dart';
import 'package:doctor_point/screens/Chatbot/widgets/x-ray_ai_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/color.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 0,
          floating: false,
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(0),
            ),
          ),
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          expandedHeight: 120,
          pinned: true,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              "Healthy Chat",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          flexibleSpace: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Text(
                "Quickly diagnose your initial health condition using artificial intelligence",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CardButton(
            img: "assets/img/background1.png",
            cardTitle: "X - Ray AI Diagnosis",
            cardSubTitle: "Diagnose your safety by X - Ray AI Diagnosis ",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return XRayAiDiagnosis();
                  },
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: CardButton(
            img: "assets/img/background2.png",
            cardTitle: "Healthy chat",
            cardSubTitle:
                "Diagnose your safety by telling the Healthy chat how you feeling  ",
            onTap: () {},
          ),
        ),
      ],
    ));
  }
}
