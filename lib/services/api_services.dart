// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:doctor_point/model/appointment.dart';
import 'package:doctor_point/model/login_request_model.dart';
import 'package:doctor_point/model/login_response_model.dart';
import 'package:doctor_point/model/register_request_model.dart';
import 'package:doctor_point/model/register_response_model.dart';
import 'package:doctor_point/services/shared_services.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {'content-type': 'application/json'};
    var url = Uri.parse('https://doctorpoint.onrender.com/users/login');
    //  var url = Uri.http(ProjectConfig.apiUrl, ProjectConfig.loginUrl);
    var response = await http.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      await SharedServices.setLoginDetail(loginResponseModel(response.body));
      print(response.body);
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {'content-type': 'application/json'};
    var url = Uri.parse('https://doctorpoint.onrender.com/users/register');
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    return registerResponseModel(response.body);
  }

  static Future<List<Appointment>> getUserDetail() async {
    var loginDetail = await SharedServices.userDetail();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetail!.data!.token}'
    };
    var url = Uri.parse('http://doctorpoint.onrender.com/appointments');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    List mapData = jsonDecode(response.body);
    List<Appointment> appointment =
        mapData.map((value) => Appointment.fromJson(value)).toList();

    return appointment;
  }

  static Future<List<dynamic>> fetchDoctors() async {
    var loginDetail = await SharedServices.userDetail();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': ''
    };
    var url = Uri.parse('http://doctorpoint.onrender.com/doctors');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      throw Exception("");
    }
  }

  static Future<List<Appointment>> fetchAppointment() async {
    var loginDetail = await SharedServices.userDetail();
    Map<String, String> requestHeaders = {
      'Authorization':
          'Basic eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiYWFAYS5jb20iLCJpYXQiOjE2ODkyNTQzNjQsImV4cCI6MTY4OTI1Nzk2NH0.p6PAbVOCB6AQC8jQrD7gKB0fs0rXGLOEjm8YfpE6_K0'
    };
    var url = Uri.parse('http://doctorpoint.onrender.com/appointments');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    List mapData = jsonDecode(response.body);
    List<Appointment> appointment =
        mapData.map((e) => Appointment.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return appointment;
    } else {
      throw Exception("");
    }
  }
}
