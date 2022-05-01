class Schedule {
  final String title;
  final String group;
  final String day;
  final String startTime;
  final String endTime;
  final String block;
  final String room;
  final String lecturer;

  Schedule({
    required this.lecturer,
    required this.room,
    required this.block,
    required this.endTime,
    required this.startTime,
    required this.day,
    required this.group,
    required this.title,
  });

  Schedule.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        group = json['title'],
        day = json['title'],
        startTime = json['title'],
        endTime = json['title'],
        block = json['title'],
        room = json['title'],
        lecturer = json['title'];

  Map<String, dynamic> toMap() {
    return {
      title: title,
      group: group,
      day: day,
      startTime: startTime,
      endTime: endTime,
      block: block,
      room: room,
      lecturer: lecturer
    };
  }
}
