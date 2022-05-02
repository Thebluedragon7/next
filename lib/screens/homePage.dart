import 'package:flutter/material.dart';
import 'package:next/models/nextSchedule.dart';
import 'package:next/providers/schedulesProvider.dart';
import 'package:next/services/apiHandler/getNextSchedule.dart';
import 'package:provider/provider.dart';

import '../widgets/drawerNext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: buildScheduleList(),
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
                child: Text(
                    data[index].day
                ),
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
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data[index].block
                ),
                Text(
                    data[index].room
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

}
