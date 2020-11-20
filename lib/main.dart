import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SecondPage.dart';
import 'model.dart';
import 'TodoList.dart';

void main() {
  var state = NewState();
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
      body: Consumer<NewState>(
        builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 340, right: 18),
        child: FloatingActionButton(
          onPressed: () async {
            var newThing = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondPage(ThingsTodo(
                        checkbox: false, text: 'What are you going do to?'))));
            if (newThing != null) {
              Provider.of<NewState>(context, listen: false).addThings(newThing);
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

  Widget _dropDownMenu() {
    return DropdownButton(
      items: [
        DropdownMenuItem(child: Text('All')),
        DropdownMenuItem(child: Text('Done')),
        DropdownMenuItem(child: Text('Undone')),
      ],
      icon: Icon(
        Icons.menu,
        size: 25,
        color: Colors.black,
      ),
      onChanged: (value) {
        setState(() {
          value = value;
        });
      },
    );
  }
}
