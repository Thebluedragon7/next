class Schedule {
  final String id;
  final String title;
  final String group;
  final String day;
  final String startTime;
  final String endTime;
  final String block;
  final String room;
  final String lecturer;

  Schedule({
    required this.id,
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
      : id = json["_id"],
        title = json['title'],
        group = json['group'],
        day = json['day'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        block = json['block'],
        room = json['room'],
        lecturer = json['lecturer'];

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "group": group,
      "day": day,
      "startTime": startTime,
      "endTime": endTime,
      "block": block,
      "room": room,
      "lecturer": lecturer
    };
  }
}
