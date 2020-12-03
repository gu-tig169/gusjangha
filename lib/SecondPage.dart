import 'package:flutter/material.dart';
import 'package:tig169app/model.dart';

class SecondPage extends StatefulWidget {
  final ThingsTodo task;
  SecondPage(this.task);

  @override
  State<StatefulWidget> createState() {
    return SecondPageState(task);
  }
}

class SecondPageState extends State<SecondPage> {
  String text;
  bool checkbox;

  TextEditingController textEditingController;

  SecondPageState(ThingsTodo task) {
    this.text = task.text;
    this.checkbox = task.checkbox;

    textEditingController = TextEditingController(text: task.text);

    textEditingController.addListener(() {
      setState(() {
        text = textEditingController.text;
      });
    });
  }

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
          _rowIconAndText(context),
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
            controller: textEditingController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2)))));
  }

  Widget _rowIconAndText(context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton.icon(
          onPressed: () {
            Navigator.pop(context, ThingsTodo(checkbox: false, text: text));
          },
          icon: Icon(Icons.add),
          label: Text('ADD'),
          textColor: Colors.black,
        )
      ],
    ));
  }
}
