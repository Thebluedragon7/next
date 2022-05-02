import 'package:flutter/material.dart';
import 'package:next/models/nextSchedule.dart';
import 'package:next/providers/schedulesProvider.dart';
import 'package:next/screens/forms/createSchedule.dart';
import 'package:next/services/apiHandler/deleteNextSchedule.dart';
import 'package:next/services/apiHandler/getNextSchedule.dart';
import 'package:next/widgets/drawerNext.dart';
import 'package:provider/provider.dart';

class AdminNext extends StatefulWidget {
  const AdminNext({Key? key}) : super(key: key);

  @override
  State<AdminNext> createState() => _AdminNextState();
}

class _AdminNextState extends State<AdminNext> {
  List<Schedule> data = [];

  @override
  void initState() {
    super.initState();
    data = context.read<ScheduleProvider>().schedules;
  }

  Future loadSchedule() async {
    context.read<ScheduleProvider>().setSchedules(await fetchSchedule());
    setState(() {
      data = context.read<ScheduleProvider>().schedules;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNext(),
      body: SafeArea(
        child: Column(
          children: [buildScheduleList(), buildAddButton()],
        ),
      ),
    );
  }

  Widget buildScheduleList() {
    double containerHeight = MediaQuery.of(context).size.height * 0.1;
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: loadSchedule,
      child: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildScheduleTile(containerHeight, width, index),
          );
        },
      ),
    );
  }

  Widget buildScheduleTile(double height, double width, int index) => Container(
        color: Colors.red,
        width: width,
        height: height,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white24,
                height: height,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data[index].day),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      data[index].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(data[index].startTime),
                          const Spacer(),
                          Text(data[index].endTime),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: height,
                color: Colors.white24,
                child: FittedBox(
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          updateSchedule(index, data[index].id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeSchedule(index, data[index].id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildAddButton() => InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreateSchedule(),
          ),
        ),
        child: Card(
          color: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.54,
            child: const FittedBox(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Add Schedule',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  removeSchedule(int index, String id) async {
    await deleteSchedule(id);
    loadSchedule();
  }

  updateSchedule(int index, String id) async {}
}
