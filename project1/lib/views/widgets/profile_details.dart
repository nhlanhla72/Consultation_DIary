import 'package:flutter/material.dart';
 
class ProfileDetails extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final String phoneNumber;
 
  ProfileDetails({
    required this.name,
    required this.role,
    required this.email,
    required this.phoneNumber,
  });
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          role,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20),
        Text(
          'Email: $email',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Phone: $phoneNumber',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}