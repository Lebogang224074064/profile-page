import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unit1_project/models/user.dart';

class UserViewModel extends ChangeNotifier {
  final User _user = User(
    null,
    'Robin',
    'James',
    '0815532801',
    'robinjames@gmail.com',
    'Software Developer',
    'Flutter',
  );

  User get user => _user;

  File? get image => _user.image;
  String get name => _user.name;
  String get surname => _user.surname;
  String get phone => _user.phone;
  String get email => _user.email;
  String get role => _user.role;
  String get language => _user.language;

  File? updateImage(File? image) {
    _user.image = image;
    notifyListeners();

    return image;
  }

  String updateName(String name) {
    _user.name = name;
    notifyListeners();

    return name;
  }

  String updateSurame(String surname) {
    _user.surname = surname;
    notifyListeners();

    return surname;
  }

  String updatePhone(String phone) {
    _user.phone = phone;
    notifyListeners();

    return phone;
  }

  String updateEmail(String email) {
    _user.email = email;
    notifyListeners();

    return email;
  }

  String updateRole(String role) {
    _user.role = role;
    notifyListeners();

    return role;
  }

  String updateLanguage(String language) {
    _user.language = language;
    notifyListeners();

    return language;
  }
}
