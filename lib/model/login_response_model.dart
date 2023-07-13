// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

import 'dart:convert';

LoginResponseModel loginResponseModel(String str) =>
    LoginResponseModel.fromJson(jsonDecode(str));

class LoginResponseModel {
  String? message;
  Data? data;

  LoginResponseModel({this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? date;
  int? iV;
  String? id;
  String? token;

  Data({this.username, this.email, this.date, this.iV, this.id, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    date = json['date'];
    iV = json['__v'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}
