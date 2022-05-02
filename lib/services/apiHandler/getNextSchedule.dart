import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/nextSchedule.dart';

List data = [];
List<Schedule> schedules = [];
Future<List<Schedule>> fetchSchedule() async {
  var url = Uri.https('next-backend-six.vercel.app', '/schedules');
  var response = await http.get(url);
  data = json.decode(response.body)['schedules'];
  schedules = data.map((json) => Schedule.fromJson(json)).toList();
  return schedules;
}
