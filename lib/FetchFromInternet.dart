import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tig169app/model.dart';

const APIURL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const APIKEY = '00110cd5-e879-4d22-84b1-7771c790200b';

class FetchFromInternet {
  static Future addToApi(ThingsTodo thing) async {
    print(thing);
    var jsonData = jsonEncode(ThingsTodo.toJson(thing));
    print(jsonData);
    await http.post(
      '$APIURL/todos?key=$APIKEY',
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
    print('Done');
  }

  static Future<List<ThingsTodo>> getTodoList() async {
    var respone = await http.get('$APIURL/todos?key=$APIKEY');
    var json = jsonDecode(respone.body);
    return json.map<ThingsTodo>((data) {
      return ThingsTodo.fromJson(data);
    }).toList();
  }

  static Future deleteApi(String thingId) async {
    await http.delete('$APIURL/todos/$thingId?key=$APIKEY');
  }

  static Future updateApi(String thingId, ThingsTodo thing) async {
    var jsonData = jsonEncode(ThingsTodo.toJson(thing));
    await http.put(
      '$APIURL/todos/$thingId?key=$APIKEY',
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
