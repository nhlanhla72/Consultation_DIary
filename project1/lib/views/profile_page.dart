import 'package:flutter/material.dart';
import 'package:project1/viewModels/profile_view_model.dart';
import 'package:project1/views/widgets/profile_details.dart';
import 'package:project1/views/widgets/profile_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:project1/views/widgets/profile_image.dart';
class ProfilePage extends StatelessWidget{

@override Widget build (BuildContext context){


  return Scaffold(

appBar: AppBar(title: Text('Profile Page'),),
body:
    ProfileDetailsScreen(),
   );
}

}