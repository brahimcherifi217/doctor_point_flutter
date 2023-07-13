// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:doctor_point/model/register_request_model.dart';
import 'package:doctor_point/widgets/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../config/config.dart';
import '../../services/api_services.dart';
import '../../widgets/clipper.dart';
import '../../widgets/go_back_button.dart';

import '../../widgets/texts.dart';


class MedicalHistoryForm extends StatefulWidget {
  MedicalHistoryForm({
    super.key,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.idNumber,
    required this.dateOfBirth,
    required this.password,
    required this.username,
  });

  String username;
  String email;
  String phoneNumber;
  String idNumber;
  String address;
  DateTime dateOfBirth;
  String password;

  @override
  State<MedicalHistoryForm> createState() => _MedicalHistoryFormState();
}

class _MedicalHistoryFormState extends State<MedicalHistoryForm> {
  @override
  Widget build(BuildContext context) {
    String? previousOperations;
    String? currentMedications;
    String? hight;
    String? wight;
    String? smoke;
    String? insuranceRef;

    bool isApiCellProcess = false;
    GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
    bool validateAndSave() {
      final form = globalFormKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      }
      return false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Clip(assetname: 'assets/img/clip3.png', place: Alignment.topRight),
          Clip(assetname: 'assets/img/clip4.png', place: Alignment.bottomLeft),
          Clip(assetname: 'assets/img/Clip1.png', place: Alignment.bottomRight),
          Clip(assetname: 'assets/img/Clip2.png', place: Alignment.topLeft),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20.0),
            child: Form(
              key: globalFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoBackButton(
                      icon: Icons.arrow_left_rounded,
                      color: Colors.black,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ScreenTitle(
                        title: 'Medical History form',
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Subtitle(
                        text: "This form will generate your medical profile",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InputTitle(
                        text: "Previous operations",
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                          width: 313,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff2661DF),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              onSaved: (newValue) {
                                previousOperations = newValue;
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Please list any Previous operations',
                                floatingLabelStyle: TextStyle(
                                  color: Colors.transparent,
                                ),
                                labelStyle: TextStyle(color: Colors.black26),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InputTitle(
                        text: 'Current medications',
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 313,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff2661DF),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            onSaved: (newValue) {
                              currentMedications = newValue;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Please list any Current medications',
                              floatingLabelStyle: TextStyle(
                                color: Colors.transparent,
                              ),
                              labelStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InputTitle(
                        text: "Height (cm's)",
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 313,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff2661DF),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              hight = newValue;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Height is required for your medical profile ";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'How tall you are ?',
                              floatingLabelStyle: TextStyle(
                                color: Colors.transparent,
                              ),
                              labelStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InputTitle(
                        text: "Weight (kg's)",
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 313,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff2661DF),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              wight = newValue;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Wight is required for your medical profile";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'how fat you are ?',
                              floatingLabelStyle: TextStyle(
                                color: Colors.transparent,
                              ),
                              labelStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InputTitle(
                        text: "Do you smoke ",
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 313,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff2661DF),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            onSaved: (newValue) {
                              smoke = newValue;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "we need to know are you smoke ?";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Please answer do you smoke ?',
                              floatingLabelStyle: TextStyle(
                                color: Colors.transparent,
                              ),
                              labelStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InputTitle(
                        text: "Insurance REF",
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 313,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff2661DF),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            onSaved: (newValue) {
                              insuranceRef = newValue;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Insurance Ref is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Type your Insurance Ref here',
                              floatingLabelStyle: TextStyle(
                                color: Colors.transparent,
                              ),
                              labelStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (validateAndSave()) {
                            setState(
                              () {
                                isApiCellProcess = true;
                              },
                            );
                            RegisterRequestModel model = RegisterRequestModel(
                                username: widget.username,
                                email: widget.email,
                                phone: widget.phoneNumber,
                                idNumber: widget.idNumber,
                                address: widget.address,
                                dateOfBirth: widget.dateOfBirth,
                                password: widget.password,
                                perviousOperations: previousOperations,
                                currentMedications: currentMedications,
                                hight: hight,
                                wight: wight,
                                smoke: smoke,
                                insuranceRef: insuranceRef);
                            ApiServices.register(model).then(
                              (response) {
                                if (response.data != null) {
                                  FormHelper.showSimpleAlertDialog(
                                      context,
                                      ProjectConfig.appName,
                                      "Your account has been created",
                                      "Home Page", () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => const NavBar(),
                                        ),
                                        (Route<dynamic> route) => false);
                                  });
                                } else {
                                  FormHelper.showSimpleAlertDialog(
                                      context,
                                      ProjectConfig.appName,
                                      response.message.toString(),
                                      "Try Again", () {
                                    Navigator.pop(context);
                                  });
                                }
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 35,
                          width: 180,
                          decoration: const BoxDecoration(
                            color: Color(0xff2661DF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: ButtonText(
                              text: 'Register',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
