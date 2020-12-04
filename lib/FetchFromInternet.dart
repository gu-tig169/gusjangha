import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tig169app/model.dart';

const APIURL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const APIKEY = '00110cd5-e879-4d22-84b1-7771c790200b';

class FetchFromInternet {
  static Future addToApi(ThingsTodo task) async {
    var jsonData = jsonEncode(ThingsTodo.toJson(task));
    await http.post(
      '$APIURL/todos?key=$APIKEY',
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<List<ThingsTodo>> getTodoList() async {
    var respone = await http.get('$APIURL/todos?key=$APIKEY');
    var json = jsonDecode(respone.body);
    return json.map<ThingsTodo>((data) {
      return ThingsTodo.fromJson(data);
    }).toList();
  }

  static Future deleteApi(String taskId) async {
    await http.delete('$APIURL/todos/$taskId?key=$APIKEY');
  }

  static Future updateApi(String taskId, ThingsTodo task) async {
    var jsonData = jsonEncode(ThingsTodo.toJson(task));
    await http.put(
      '$APIURL/todos/$taskId?key=$APIKEY',
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
