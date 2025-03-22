import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/profile.dart';

class ProfileViewModel with ChangeNotifier {
 
  

  final Profile _profile = Profile(
      image: null,
      name: 'Mpho Mbele',
      role: 'Software Developer',
      email: 'mmbele@cut.ac.za',
      phoneNumber: '051 507 4382');




  String get name => _profile.name;
  String get email => _profile.email;
  String get phoneNumber => _profile.phoneNumber;
  String get role => _profile.role;
File? get image => _profile.image;
  final ImagePicker _picker = ImagePicker();

Future<void> pickImage() async {
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    _profile.image = File(pickedFile.path);
    print("Selected image path: ${pickedFile.path}"); // Debugging
    notifyListeners();
  } else {
    print("No image selected.");
  }
}

  void updateName(String newName) {
    _profile.name = newName;
    notifyListeners();
  }

  void updateRole(String newRole) {
    _profile.role = newRole;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _profile.email = newEmail;
    notifyListeners();
  }

  void updatePhoneNumber(String newPhoneNumber) {
    _profile.phoneNumber = newPhoneNumber;
    notifyListeners();
  }
}
