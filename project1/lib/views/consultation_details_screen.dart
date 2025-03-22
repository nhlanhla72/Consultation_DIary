import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project1/viewModels/consultation_view_model.dart';

class PropertyDetailScreen extends StatelessWidget {
  final int index; // Index of the selected consultation

  PropertyDetailScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation Details'),
        backgroundColor: Colors.purple, // App bar color (can be overridden by global theme)
      ),
      body: Consumer<ConsultationViewModel>(
        builder: (context, consultationViewModel, child) {
          final consultation = consultationViewModel.consultations[index];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${consultation.date}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Time: ${consultation.time}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Description: ${consultation.description}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Topic: ${consultation.topic}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Back to Home'),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _showDeleteDialog(context, consultationViewModel),
                    child: Text('Delete Consultation'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, ConsultationViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Consultation'),
          content: Text('Are you sure you want to delete this consultation?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                viewModel.deleteConsultation(viewModel.consultations[index]); // Delete the consultation
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}