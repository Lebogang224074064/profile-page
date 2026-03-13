// Programmer name:   Lebogang Tsatsi
// Student number:    224074064
// Program purpose:   Profile page allows user to edit personal information,
//                    upload a profile image from gallery or using camera.

import 'dart:io';

class User {
  File? image;
  String name;
  String surname;
  String phone;
  String email;
  String role;
  String language;

  User(
    this.image,
    this.name,
    this.surname,
    this.phone,
    this.email,
    this.role,
    this.language,
  );
}
