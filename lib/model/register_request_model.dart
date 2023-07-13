// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals
class RegisterRequestModel {
  String? username;
  String? email;
  String? phone;
  String? idNumber;
  String? address;
  DateTime? dateOfBirth;
  String? password;
  String? perviousOperations;
  String? currentMedications;
  String? hight;
  String? wight;
  String? smoke;
  String? insuranceRef;

  RegisterRequestModel(
      {this.username,
      this.email,
      this.phone,
      this.idNumber,
      this.address,
      this.dateOfBirth,
      this.password,
      this.perviousOperations,
      this.currentMedications,
      this.hight,
      this.wight,
      this.smoke,
      this.insuranceRef});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    idNumber = json['id_number'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    password = json['password'];
    perviousOperations = json['pervious_operations'];
    currentMedications = json['current_medications'];
    hight = json['hight'];
    wight = json['wight'];
    smoke = json['smoke'];
    insuranceRef = json['insurance_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['id_number'] = this.idNumber;
    data['address'] = this.address;
    data['date_of_birth'] = this.dateOfBirth;
    data['password'] = this.password;
    data['pervious_operations'] = this.perviousOperations;
    data['current_medications'] = this.currentMedications;
    data['hight'] = this.hight;
    data['wight'] = this.wight;
    data['smoke'] = this.smoke;
    data['insurance_ref'] = this.insuranceRef;
    return data;
  }
}