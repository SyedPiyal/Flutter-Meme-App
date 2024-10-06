// To parse this JSON data, do
//
//     final registrationRequest = registrationRequestFromJson(jsonString);

import 'dart:convert';

User registrationRequestFromJson(String str) => User.fromJson(json.decode(str));

String registrationRequestToJson(User data) => json.encode(data.toJson());

class User {
  String? email;
  String? password;

  User({
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
