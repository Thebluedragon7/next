import 'package:flutter/material.dart';
import 'package:next/models/nextSchedule.dart';
import 'package:next/services/apiHandler/getNextSchedule.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Schedule>>(
            future: fetchSchedule(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(data[index].title),
                        subtitle: Text(data[index].day),
                      );
                    }
                );
              } else if (snapshot.hasError) {
                return Container();
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
