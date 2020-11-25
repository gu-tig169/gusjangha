import 'package:flutter/material.dart';

class ThingsTodo {
  bool checkbox;
  String text;
  ThingsTodo({this.checkbox, this.text});
}

class NewState extends ChangeNotifier {
  List<ThingsTodo> _list = [
    ThingsTodo(checkbox: false, text: 'Write a book'),
    ThingsTodo(checkbox: false, text: 'Do homework'),
    ThingsTodo(checkbox: true, text: 'Tidy room'),
    ThingsTodo(checkbox: false, text: 'Watch TV'),
    ThingsTodo(checkbox: false, text: 'Nap'),
    ThingsTodo(checkbox: false, text: 'Shop groceries'),
    ThingsTodo(checkbox: false, text: 'Have fun'),
    ThingsTodo(checkbox: false, text: 'Meditate'),
  ];
  List<ThingsTodo> get list => _list;

  void addThings(ThingsTodo thing) {
    _list.add(thing);
    notifyListeners();
  }

  void removeThings(ThingsTodo thing) {
    _list.remove(thing);
    notifyListeners();
  }
}
