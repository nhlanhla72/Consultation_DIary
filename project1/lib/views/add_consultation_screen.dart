import 'package:flutter/material.dart';
import 'package:project1/models/consultation.dart';
import 'package:project1/viewModels/consultation_view_model.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date (current date)
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2101), // Latest selectable date
    );
    if (picked != null) {
      _dateController.text = "${picked.toLocal()}".split(' ')[0]; // Format: YYYY-MM-DD
    }
  }

  // Function to show the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Initial time (current time)
    );
    if (picked != null) {
      _timeController.text = picked.format(context); // Format: HH:MM AM/PM
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Consultation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ConsultationViewModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                // Date Field
                GestureDetector(
                  onTap: () => _selectDate(context), // Open date picker on tap
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: "Select Date",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ), // End of date text field

                SizedBox(height: 16), // Add space
                // Time Field
                GestureDetector(
                  onTap: () => _selectTime(context), // Open time picker on tap
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _timeController,
                      decoration: InputDecoration(
                        labelText: "Select Time",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ), // End of time text field

                SizedBox(height: 16), // Add spacing between fields

                // Description Field
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                ), // End of description text field

                SizedBox(height: 16), // Add spacing between fields

                // Topic Field
                TextField(
                  controller: _topicController,
                  decoration: InputDecoration(
                    labelText: "Topic",
                    border: OutlineInputBorder(),
                  ),
                ), // End of topic text field

                SizedBox(height: 24), // Add spacing before the button

                // Save Button
                ElevatedButton(
                  onPressed: () {
                    // Check if any field is empty
                    if (_dateController.text.isEmpty ||
                        _timeController.text.isEmpty ||
                        _descriptionController.text.isEmpty ||
                        _topicController.text.isEmpty) {
                      // Show a snackbar if any field is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('All fields are required!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      // Create a new Consultation object
                      final Consultation consultation = Consultation(
                        date: _dateController.text,
                        time: _timeController.text,
                        description: _descriptionController.text,
                        topic: _topicController.text,
                      );

                      // Add the consultation to the ViewModel
                      value.addConsultation(consultation);

                      // Show a success snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Consultation added successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      // Navigate back to the HomeScreen after a short delay
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text('Save'),
                ), // End of save button
              ],
            );
          },
        ),
      ),
    );
  }
}