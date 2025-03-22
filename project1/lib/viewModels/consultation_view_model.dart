import 'package:flutter/material.dart';
import 'package:project1/models/consultation.dart';

class ConsultationViewModel with ChangeNotifier{

 
  final Consultation _consultation=Consultation(date: '',time: '', description: '', topic: '');
  List<Consultation>consultations=[];
  String get date=>_consultation.date;
  String get time=>_consultation.time;
  String get description=>_consultation.description;
  String get topic=>_consultation.time;
  List<Consultation> get consultation=>_consultation.consultations;

  void addDate(String newDate){

    _consultation.date=newDate;
    notifyListeners();
  }
  void addTime(String newTime){

    _consultation.date=newTime;
    notifyListeners();
  }
  void addDescription(String newDescription){

    _consultation.date=newDescription;
    notifyListeners();
  }
    void addTopic(String newTopic){

    _consultation.date=newTopic;
    notifyListeners();
  }
    void addConsultation(Consultation consultation){

    consultations.add(consultation);
    notifyListeners();
  }
      void deleteConsultation(Consultation consultation){

    consultations.remove(consultation);
    notifyListeners();
  }


}