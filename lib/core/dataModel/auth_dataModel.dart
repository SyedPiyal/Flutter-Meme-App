// To parse this JSON data, do
//
//     final registrationRequest = registrationRequestFromJson(jsonString);

import 'dart:convert';

RegistrationRequest registrationRequestFromJson(String str) => RegistrationRequest.fromJson(json.decode(str));

String registrationRequestToJson(RegistrationRequest data) => json.encode(data.toJson());

class RegistrationRequest {
  String? email;
  String? password;

  RegistrationRequest({
    this.email,
    this.password,
  });

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) => RegistrationRequest(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}

// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString);


RegistrationResponse registrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());

class RegistrationResponse {
  int? id;
  String? token;

  RegistrationResponse({
    this.id,
    this.token,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}


