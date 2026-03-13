// Programmer name:   Lebogang Tsatsi
// Student number:    224074064
// Program purpose:   Profile page allows user to edit personal information,
//                    upload a profile image from gallery or using camera.

import 'package:flutter/material.dart';

class CListTile extends StatelessWidget {
  const CListTile({
    super.key,
    required this.label,
    required this.userInfo,
    required this.onTap,
  });

  final String userInfo;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color(0xFF616161),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF0E0E0E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: Text(
              userInfo,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: onTap,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
