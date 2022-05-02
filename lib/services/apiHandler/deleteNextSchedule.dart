import 'dart:convert';
import 'package:http/http.dart' as http;

Future deleteSchedule(String id) async {
  var url = Uri.https('next-backend-six.vercel.app', '/schedules/$id');
  await http.delete(url);
}
