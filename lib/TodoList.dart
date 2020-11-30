import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TodoList extends StatefulWidget {
  final List<ThingsTodo> list;
  TodoList(this.list);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Widget build(BuildContext context) {
    return ListView(
        children:
            widget.list.map((thing) => _thingsItem(context, thing)).toList());
  }

  Widget _thingsItem(context, thing) {
    if (thing.checkbox == true) {
      return CheckboxListTile(
          title: Text(
            thing.text,
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          secondary: IconButton(
            icon: Icon(Icons.cancel_outlined, color: Colors.black),
            onPressed: () {
              var state = Provider.of<NewState>(context, listen: false);
              state.removeThings(thing);
            },
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: thing.checkbox,
          onChanged: (bool value) {
            var state = Provider.of<NewState>(context, listen: false);
            state.setCheckbox(thing, value);
          });
    }
    return CheckboxListTile(
        title: Text(thing.text),
        secondary: IconButton(
          icon: Icon(Icons.cancel_outlined, color: Colors.black),
          onPressed: () {
            var state = Provider.of<NewState>(context, listen: false);
            state.removeThings(thing);
          },
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: thing.checkbox,
        onChanged: (bool value) {
          var state = Provider.of<NewState>(context, listen: false);
          state.setCheckbox(thing, value);
        });
  }
}
