import 'package:flutter/material.dart';
import 'package:project1/viewModels/consultation_view_model.dart';
import 'package:project1/views/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:project1/routes/route_manager.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation App'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.profile);
            },
          ),
        ],
      ),
      body: Consumer<ConsultationViewModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.consultations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${value.consultations[index].topic}"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteManager.consultationDetails,
                    arguments: index, // Pass the index to the details screen
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, RouteManager.profile);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteManager.addConsultation);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
