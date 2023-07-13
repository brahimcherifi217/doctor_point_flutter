// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
  RegisterResponseModel.fromJson(jsonDecode(str));

class RegisterResponseModel {
  String? message;
  Data? data;

  RegisterResponseModel({this.message, this.data});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? email;
  String? phone;
  String? idNumber;
  String? address;
  String? dateOfBirth;
  String? perviousOperations;
  String? currentMedications;
  String? hight;
  String? wight;
  String? smoke;
  String? insuranceRef;
  String? date;
  int? iV;
  String? id;

  Data(
      {this.username,
      this.email,
      this.phone,
      this.idNumber,
      this.address,
      this.dateOfBirth,
      this.perviousOperations,
      this.currentMedications,
      this.hight,
      this.wight,
      this.smoke,
      this.insuranceRef,
      this.date,
      this.iV,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    idNumber = json['id_number'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    perviousOperations = json['pervious_operations'];
    currentMedications = json['current_medications'];
    hight = json['hight'];
    wight = json['wight'];
    smoke = json['smoke'];
    insuranceRef = json['insurance_ref'];
    date = json['date'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['id_number'] = this.idNumber;
    data['address'] = this.address;
    data['date_of_birth'] = this.dateOfBirth;
    data['pervious_operations'] = this.perviousOperations;
    data['current_medications'] = this.currentMedications;
    data['hight'] = this.hight;
    data['wight'] = this.wight;
    data['smoke'] = this.smoke;
    data['insurance_ref'] = this.insuranceRef;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}