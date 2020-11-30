import 'package:flutter/material.dart';
import 'FetchFromInternet.dart';

class ThingsTodo {
  bool checkbox;
  String text;
  String id;
  ThingsTodo({this.checkbox, this.text, this.id});

  static Map<String, dynamic> toJson(ThingsTodo thing) {
    return {'title': thing.text, 'done': thing.checkbox};
  }

  static ThingsTodo fromJson(Map<String, dynamic> jsonData) {
    return ThingsTodo(
      id: jsonData['id'],
      text: jsonData['title'],
      checkbox: jsonData['done'],
    );
  }
}

class NewState extends ChangeNotifier {
  List<ThingsTodo> _list = [];

  List<ThingsTodo> get list => _list;

  String _sortBy = 'All';
  String get sortBy => _sortBy;

  Future getList() async {
    List<ThingsTodo> list = await FetchFromInternet.getTodoList();
    _list = list;
    notifyListeners();
  }

  void addThings(ThingsTodo thing) async {
    await FetchFromInternet.addToApi(thing);
    await getList();
  }

  void removeThings(ThingsTodo thing) async {
    await FetchFromInternet.deleteApi(thing.id);
    await getList();
  }

  void sortFilterBy(String sortBy) {
    this._sortBy = sortBy;
    notifyListeners();
  }

  void setCheckbox(ThingsTodo thing, bool checkbox) async {
    thing.checkbox = checkbox;
    await FetchFromInternet.updateApi(thing.id, thing);
    await getList();
  }
}
