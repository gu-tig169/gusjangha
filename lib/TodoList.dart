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
        children: widget.list.map((task) => _taskItem(context, task)).toList());
  }

  Widget _taskItem(context, task) {
    if (task.checkbox == true) {
      return CheckboxListTile(
          title: Text(
            task.text,
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          secondary: IconButton(
            icon: Icon(Icons.cancel_outlined, color: Colors.black),
            onPressed: () {
              var state = Provider.of<NewState>(context, listen: false);
              state.removeTask(task);
            },
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: task.checkbox,
          onChanged: (bool value) {
            var state = Provider.of<NewState>(context, listen: false);
            state.setCheckbox(task, value);
          });
    }
    return CheckboxListTile(
        title: Text(task.text),
        secondary: IconButton(
          icon: Icon(Icons.cancel_outlined, color: Colors.black),
          onPressed: () {
            var state = Provider.of<NewState>(context, listen: false);
            state.removeTask(task);
          },
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: task.checkbox,
        onChanged: (bool value) {
          var state = Provider.of<NewState>(context, listen: false);
          state.setCheckbox(task, value);
        });
  }
}
