import 'package:flutter/material.dart';
import 'package:state_managment_provider/person.dart';

class PersonListModel with ChangeNotifier {
  List<Person> personList = [];
  void addPerson(Person curPerson) {
    this.personList.add(curPerson);
    notifyListeners();
  }

  void removePerson(int index) {
    this.personList.removeAt(index);
    notifyListeners();
  }
}
