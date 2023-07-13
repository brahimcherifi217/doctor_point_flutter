import 'package:doctor_point/services/api_services.dart';
import 'package:flutter/material.dart';

class ElectronicHealthRecord extends StatefulWidget {
  const ElectronicHealthRecord({super.key});

  @override
  State<ElectronicHealthRecord> createState() => _ElectronicHealthRecordState();
}

class _ElectronicHealthRecordState extends State<ElectronicHealthRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ApiServices.fetchAppointment(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Center(child: Text(''));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: Text("err"));
      },
    ));
  }
}
