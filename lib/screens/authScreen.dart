// ignore_for_file: file_names

import 'package:doctor_point/screens/Login/login.dart';
import 'package:doctor_point/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2661DF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/img/Clip1.png'),
          ),
          RotatedBox(
            quarterTurns: 0,
            child: Image.asset('assets/img/Clip2.png'),
          ),
           Align(
            alignment: Alignment.center,
            child: Text(
              "DOCTOR'S POINT",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const Login();
                      }));
                    },
                    child: Container(
                      height: 42,
                      width: 319,
                      decoration: BoxDecoration(
                        color: const Color(0xff6ed9d3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Register();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 42,
                      width: 319,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xff6ed9d3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Center(
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
