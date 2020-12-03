import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SecondPage.dart';
import 'model.dart';
import 'TodoList.dart';

void main() {
  var state = NewState();
  state.getList();
  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('TIG 169 TODO', style: TextStyle(color: Colors.black)),
          actions: [
            _dropDownMenu(),
          ]),
      body: _viewList(),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 340, right: 18),
        child: FloatingActionButton(
          onPressed: () async {
            var newTask = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondPage(ThingsTodo(
                        checkbox: false, text: 'What are you going do to?'))));
            if (newTask != null) {
              Provider.of<NewState>(context, listen: false).addTask(newTask);
            }
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 50,
          ),
        ),
      ),
    );
  }

  Widget _viewList() {
    return Consumer<NewState>(
        builder: (context, state, child) =>
            TodoList(_sortList(state.list, state.sortBy)));
  }

  Widget _dropDownMenu() {
    return DropdownButton(
        items: [
          DropdownMenuItem(
            child: Text('All'),
            value: 'All',
          ),
          DropdownMenuItem(
            child: Text('Done'),
            value: 'Done',
          ),
          DropdownMenuItem(
            child: Text('Undone'),
            value: 'Undone',
          ),
        ],
        icon: Icon(
          Icons.menu,
          size: 25,
          color: Colors.black,
        ),
        onChanged: (value) {
          Provider.of<NewState>(context, listen: false).sortFilterBy(value);
        });
  }

  List<ThingsTodo> _sortList(list, sortBy) {
    if (sortBy == 'All') return list;
    if (sortBy == 'Done')
      return list.where((task) => task.checkbox == true).toList();
    if (sortBy == 'Undone')
      return list.where((task) => task.checkbox == false).toList();
    return null;
  }
}
