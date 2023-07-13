// ignore_for_file: unused_local_variable, unused_element

import 'package:doctor_point/screens/Login/login.dart';
import 'package:doctor_point/screens/Medical_history_form/medical_history_form.dart';
import 'package:doctor_point/screens/authScreen.dart';
import 'package:doctor_point/widgets/buttonAction.dart';
import 'package:doctor_point/widgets/text_input.dart';
import 'package:flutter/material.dart';
import '../../widgets/clipper.dart';
import '../../widgets/go_back_button.dart';
import '../../widgets/texts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? username;
    String? email;
    String? phoneNumber;
    String? idNumber;
    String? address;
    DateTime? dateOfBirth;
    String? password;
    bool isApiCellProcess = false;
    TextEditingController dateController = TextEditingController();

    bool validateAndSave() {
      final form = globalFormKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      }
      return false;
    }

    DateTime selectedDate;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Clip(assetname: 'assets/img/clip3.png', place: Alignment.topRight),
          Clip(assetname: 'assets/img/clip4.png', place: Alignment.bottomLeft),
          Clip(assetname: 'assets/img/Clip1.png', place: Alignment.bottomRight),
          Clip(assetname: 'assets/img/Clip2.png', place: Alignment.topLeft),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: globalFormKey,
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
                    title: 'Create your account',
                    color: Colors.black,
                  ),
                  Wrap(
                    children: [
                      Subtitle(
                        text: "If you have an account please",
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: InkWell(
                          child: Subtitle(
                            text: 'Login',
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const Login();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  InputTitle(
                    text: 'Username',
                    color: Colors.black,
                  ),
                  TextInput(
                    hintText: "Type your Username Here",
                    onSaved: (newValue) {
                      username = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  InputTitle(
                    text: 'Email',
                    color: Colors.black,
                  ),
                  TextInput(
                    hintText: "Type your Email here",
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
                  const SizedBox(height: 5),
                  InputTitle(
                    text: 'Phone Number',
                    color: Colors.black,
                  ),
                  TextInput(
                    keyboardType: TextInputType.phone,
                    hintText: "Type your Phone Number here",
                    onSaved: (newValue) {
                      phoneNumber = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Number can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  InputTitle(
                    text: 'ID Number',
                    color: Colors.black,
                  ),
                  TextInput(
                    keyboardType: TextInputType.number,
                    hintText: "Type your ID Number here",
                    onSaved: (newValue) {
                      idNumber = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Id Number can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  InputTitle(
                    text: 'Address',
                    color: Colors.black,
                  ),
                  TextInput(
                    keyboardType: TextInputType.streetAddress,
                    hintText: "Type your Address here",
                    onSaved: (newValue) {
                      address = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Address can't be empty";
                      }
                      return null;
                    },
                  ),
                  InputTitle(
                    text: 'Date of birth',
                    color: Colors.black,
                  ),
                  TextInput(
                    hintText: "Select your date of birth",
                    onTap: () async {
                      DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1930),
                        lastDate: DateTime.now(),
                      );
                      if (pickDate != null) {
                        setState(() {
                          dateController.text = pickDate.toString();
                          dateOfBirth = pickDate;
                        });
                        print(dateOfBirth);
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  InputTitle(
                    text: 'Password',
                    color: Colors.black,
                  ),
                  TextInput(
                    hintText: "Type your Password here",
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
                  SizedBox(height: size.height * 0.03),
                  Center(
                    child: ButtonAction(
                      onTap: () {
                        if (validateAndSave()) {
                          setState(() {
                            isApiCellProcess = true;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MedicalHistoryForm(
                                  username: username!,
                                  email: email!.toLowerCase(),
                                  phoneNumber: phoneNumber!,
                                  idNumber: idNumber!,
                                  address: address!,
                                  dateOfBirth: dateOfBirth!,
                                  password: password!,
                                );
                              },
                            ),
                          );
                        }
                      },
                      text: "NEXT",
                      buttonColor: const Color(0xff2661DF),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
