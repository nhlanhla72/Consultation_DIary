import 'package:flutter/material.dart';
import 'package:project1/views/consultation_details_screen.dart';
import 'package:project1/views/home_screen.dart';
import 'package:project1/views/add_consultation_screen.dart';
import 'package:project1/views/profile_page.dart';


class RouteManager {
  static const String home = '/';
  static const String addConsultation = '/addConsultation';
  static const String profile = '/profile';
  static const String consultationDetails = '/consultationDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case addConsultation:
        return MaterialPageRoute(builder: (_) => AddScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case consultationDetails:
        final int index = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => PropertyDetailScreen(index: index),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route found for ${settings.name}')),
          ),
        );
    }
  }
}
