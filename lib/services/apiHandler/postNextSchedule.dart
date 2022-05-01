import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/nextSchedule.dart';

List data = [];
List<Schedule> schedules = [];

Future<List<Schedule>> fetchFood() async {
  var url = Uri.https('next-backend-six.vercel.app', '/schedules');
  var response = await http.get(url);
  data = json.decode(response.body)['schedules'];
  schedules = data.map((json) => Schedule.fromJson(json)).toList();
  return schedules;
}

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
