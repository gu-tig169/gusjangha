import 'package:flutter/material.dart';
import 'FetchFromInternet.dart';

class ThingsTodo {
  bool checkbox;
  String text;
  String id;
  ThingsTodo({this.checkbox, this.text, this.id});

  static Map<String, dynamic> toJson(ThingsTodo task) {
    return {'title': task.text, 'done': task.checkbox};
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

  void addTask(ThingsTodo task) async {
    await FetchFromInternet.addToApi(task);
    await getList();
  }

  void removeTask(ThingsTodo task) async {
    await FetchFromInternet.deleteApi(task.id);
    await getList();
  }

  void sortFilterBy(String sortBy) {
    this._sortBy = sortBy;
    notifyListeners();
  }

  void setCheckbox(ThingsTodo task, bool checkbox) async {
    task.checkbox = checkbox;
    await FetchFromInternet.updateApi(task.id, task);
    await getList();
  }
}
