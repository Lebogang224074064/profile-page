// Programmer name:   Lebogang Tsatsi
// Student number:    224074064
// Program purpose:   Profile page allows user to edit personal information,
//                    upload a profile image from gallery or using camera.

import 'package:flutter/material.dart';
import 'package:unit1_project/views/profile.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilePage());
  }
}
