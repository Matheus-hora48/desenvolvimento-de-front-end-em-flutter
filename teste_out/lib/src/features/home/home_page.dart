import 'package:flutter/material.dart';

import '../profile/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          label: '',
        ),
      ]),
    );
  }
}
