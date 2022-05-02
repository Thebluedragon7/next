import 'package:flutter/material.dart';
import 'package:next/screens/admin/admin.dart';
import 'package:next/screens/homePage.dart';

class DrawerNext extends StatelessWidget {
  const DrawerNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage()
                ),
              ),
            ),
            ListTile(
              title: const Text("Admin"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const AdminNext()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
