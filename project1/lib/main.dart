import 'package:flutter/material.dart';
import 'package:project1/viewModels/consultation_view_model.dart';
import 'package:project1/viewModels/profile_view_model.dart';
import 'package:project1/routes/route_manager.dart'; // Import the route manager
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define your custom theme
  final ThemeData customTheme = ThemeData(
    // Primary color (used for app bars, buttons, etc.)
    primaryColor: Color.fromARGB(255, 170, 0, 170), // Purple for primary
    // Color scheme
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 170, 0, 170), // Purple for primary elements
      secondary: Color.fromARGB(255, 170, 0, 170), // Purple accent color
      onPrimary: Colors.white, // White text on purple background
    ),
    // App bar theme
    appBarTheme: AppBarTheme(
      color: Color.fromARGB(255, 170, 0, 170), // Purple app bar background
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white, // White app bar title text
      ),
    ),
    // Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 170, 0, 170), // Purple background
      selectedItemColor: Colors.white, // White selected item
      unselectedItemColor: Colors.white.withOpacity(0.6), // Semi-transparent white for unselected items
    ),
    // Text theme
 
    // Button theme (using buttonColor for older Flutter versions)
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromARGB(255, 170, 0, 170), // Purple button background
      textTheme: ButtonTextTheme.primary, // White text on buttons
    ),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConsultationViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
      ],
      child: MaterialApp(
        title: 'Consultation App',
        theme: customTheme, // Apply the custom theme
        initialRoute: RouteManager.home,  // Set initial route
        onGenerateRoute: RouteManager.generateRoute,  // Use route manager
      ),
    );
  }
}