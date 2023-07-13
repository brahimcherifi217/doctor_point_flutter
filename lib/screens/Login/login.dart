// ignore_for_file: must_be_immutable

import 'package:doctor_point/model/login_request_model.dart';

import 'package:doctor_point/screens/register/register.dart';
import 'package:doctor_point/services/api_services.dart';
import 'package:doctor_point/widgets/NavBar.dart';
import 'package:doctor_point/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../config/config.dart';
import '../../widgets/buttonAction.dart';
import '../../widgets/go_back_button.dart';
import '../../widgets/texts.dart';
import '../../widgets/clipper.dart';

import '../authScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isApiCellProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: globalFormKey,
        child: Stack(
          children: [
            Clip(assetname: 'assets/img/clip3.png', place: Alignment.topRight),
            Clip(
                assetname: 'assets/img/clip4.png', place: Alignment.bottomLeft),
            Clip(
                assetname: 'assets/img/Clip1.png',
                place: Alignment.bottomRight),
            Clip(assetname: 'assets/img/Clip2.png', place: Alignment.topLeft),
            Padding(
              padding: const EdgeInsets.all(25),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GoBackButton(
                      icon: Icons.arrow_left_rounded,
                      color: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const AuthScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  ScreenTitle(
                    title: 'Login',
                    color: Colors.black,
                  ),
                  Wrap(
                    children: [
                      Subtitle(
                        text: "If you don't have an account please",
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: InkWell(
                          child: Subtitle(
                            text: 'register',
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  InputTitle(
                    text: 'Email',
                    color: Colors.black,
                  ),
                  TextInput(
                    hintText: "Type your Email here",
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (newValue) {
                      email = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputTitle(
                    text: 'Password',
                    color: Colors.black,
                  ),
                  TextInput(
                    // keyboardType: TextInputType.,
                    hintText: "Type Your Password",
                    onSaved: (newValue) {
                      password = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.13),
                  Center(
                    child: ButtonAction(
                      text: "LOGIN",
                      buttonColor: const Color(0xff2661DF),
                      textColor: Colors.white,
                      onTap: () {
                        if (validateAndSave()) {
                          setState(
                            () {
                              isApiCellProcess = true;
                            },
                          );
                          LoginRequestModel model = LoginRequestModel(
                              email: email!.toLowerCase(), password: password);
                          ApiServices.login(model).then(
                            (response) {
                              if (response) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const NavBar(),
                                    ),
                                    (Route<dynamic> route) => false);
                              } else {
                                FormHelper.showSimpleAlertDialog(
                                    context,
                                    ProjectConfig.appName,
                                    "Invalid Email or Password",
                                    "Try Again", () {
                                  Navigator.pop(context);
                                });
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
