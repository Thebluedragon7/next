import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/nextSchedule.dart';

List data = [];
List<Schedule> schedules = [];

Future<Schedule> uploadSchedule(Schedule schedule) async {
  var url = Uri.https('eat-street-pokhara.vercel.app', '/api/foods');
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: schedule.toMap(),
  );

  if (response.statusCode == 201) {
    return Schedule.fromJson(json.decode(response.body));
  } else {
    throw Exception('Food loading failed!');
  }
}
