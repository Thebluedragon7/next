import 'package:flutter/material.dart';
import 'package:next/models/nextSchedule.dart';
import 'package:next/services/apiHandler/postNextSchedule.dart';
import 'dart:math';

class CreateSchedule extends StatefulWidget {
  const CreateSchedule({Key? key}) : super(key: key);

  @override
  State<CreateSchedule> createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {
  final titleController = TextEditingController();
  final groupController = TextEditingController();
  final dayController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final blockController = TextEditingController();
  final roomController = TextEditingController();
  final lecturerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildNextInput(context,
                  label: "Title", controller: titleController),
              buildNextInput(context,
                  label: "Group", controller: groupController),
              buildNextInput(context, label: "Day", controller: dayController),
              buildNextInput(context,
                  label: "Start Time", controller: startTimeController),
              buildNextInput(context,
                  label: "End Time", controller: endTimeController),
              buildNextInput(context,
                  label: "Block", controller: blockController),
              buildNextInput(context,
                  label: "Room", controller: roomController),
              buildNextInput(context,
                  label: "Lecturer", controller: lecturerController),
              ElevatedButton(
                child: const Text("submit"),
                onPressed: () {
                  uploadSchedule(Schedule(
                      id: random.nextInt(999999).toString(),
                      lecturer: lecturerController.text,
                      room: roomController.text,
                      block: blockController.text,
                      endTime: endTimeController.text,
                      startTime: startTimeController.text,
                      day: dayController.text,
                      group: groupController.text,
                      title: titleController.text));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNextInput(BuildContext context,
      {required String label, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            label: Text(label),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        controller: controller,
      ),
    );
  }
}
