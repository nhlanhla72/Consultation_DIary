import 'package:flutter/material.dart';
import 'package:project1/viewModels/profile_view_model.dart';
import 'package:project1/views/widgets/profile_details.dart';
import 'package:project1/views/widgets/profile_image.dart';
import 'package:project1/views/widgets/update_button.dart';
import 'package:provider/provider.dart';

class ProfileDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ProfileViewModel>(builder: (context, value, child) {
      return Column(
       
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileImage(
            image: value.image,
            onImagePick: value.pickImage,
          ),
          SizedBox(height: 10),
          ProfileDetails(
            name: value.name,
            role: value.role,
            email: value.email,
            phoneNumber: value.phoneNumber,
          ),
          SizedBox(height: 20),
           UpdateButton(
            onUpdate: () {
              value.updateName('Bhelekazi');
              value.updateRole('Lecturer');
              value.updateEmail('bhelekazi@cut.ac.za');
              value.updatePhoneNumber('051-507-5555');
            },
          ),
        ],
      );
    }));
  }
}
