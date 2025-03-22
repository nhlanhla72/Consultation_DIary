import 'dart:io';

class Profile{

  
  String email;
  String name;
  String role;
  String phoneNumber;
  File? image;



  Profile({this.image, required this.name,required this.role, required this.email, required this.phoneNumber});
  
}