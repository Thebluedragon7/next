import 'package:flutter/cupertino.dart';
import 'package:next/models/nextSchedule.dart';
import 'package:collection/collection.dart';

class ScheduleProvider with ChangeNotifier {
  Map<String, List<Schedule>> _schedulesMap = {};

  List<Schedule> _schedules = [];

  Map<String, List<Schedule>> get schedulesMap => _schedulesMap;
  List<Schedule> get schedules => _schedules;

  setSchedules(List<Schedule> schedules) {
    _schedules = schedules;
    _schedulesMap = groupBy(_schedules, (Schedule obj) => obj.group);
  }
}