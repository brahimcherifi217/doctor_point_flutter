// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

import 'dart:convert';

Appointment appointmentModel(String str) =>
    Appointment.fromJson(jsonDecode(str));

class Appointment {
  String? day;
  bool? selected;
  List<String>? morning;
  List<String>? evening;

  Appointment({this.day, this.morning, this.evening, this.selected});

  Appointment.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    morning = json['morning'].cast<String>();
    evening = json['evening'].cast<String>();
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['morning'] = this.morning;
    data['evening'] = this.evening;
    data['selected'] = this.selected;
    return data;
  }
}
