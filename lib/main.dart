import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('TIG 169 TODO', style: TextStyle(color: Colors.black)),
          actions: [
            _popUpMenu(),
          ]),
      body: _todoList(),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 340, right: 18),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
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

  Widget _todoList() {
    var list = [
      'Write a book',
      'Do homework',
      'Tidy room',
      'Watch TV',
      'Nap',
      'Shop groceries',
      'Have fun',
      'Meditate'
    ];

    return ListView(
      children: list.map((things) => _thingsToDo(things)).toList(),
    );
  }

  Widget _thingsToDo(text) {
    return ListTile(
      leading: Checkbox(value: false, onChanged: (val) {}),
      title: Text(text),
      trailing: IconButton(
        icon: Icon(Icons.cancel_outlined, color: Colors.black),
        onPressed: () {},
      ),
    );
  }

  Widget _popUpMenu() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('All'),
        ),
        PopupMenuItem(
          child: Text('Done'),
        ),
        PopupMenuItem(child: Text('Undone')),
      ],
      icon: Icon(
        Icons.menu,
        size: 35,
        color: Colors.black,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            title: Text('TIG 169 TODO', style: TextStyle(color: Colors.black)),
          ),
          _textField(),
          _rowIconAndText(),
        ],
      ),
    ));
  }

  Widget _textField() {
    return Container(
        width: 351,
        height: 50,
        margin: EdgeInsets.only(left: 30, right: 30, top: 39),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'What are you going do to?',
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 4.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 4.0),
            ),
          ),
        ));
  }

  Widget _rowIconAndText() {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('ADD'),
          textColor: Colors.black,
        )
      ],
    ));
  }
}
