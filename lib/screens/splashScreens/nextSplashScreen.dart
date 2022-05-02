import 'package:flutter/material.dart';
import 'package:next/providers/schedulesProvider.dart';
import 'package:next/screens/homePage.dart';

import '../../services/apiHandler/getNextSchedule.dart';

class NextSplashScreen extends StatefulWidget {
  const NextSplashScreen({Key? key}) : super(key: key);

  @override
  State<NextSplashScreen> createState() => _NextSplashScreenState();
}

class _NextSplashScreenState extends State<NextSplashScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await context.read<ScheduleProvider>().setSchedules(await fetchSchedule());
    if (context.read<ScheduleProvider>().schedules.isNotEmpty) {

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
