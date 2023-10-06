import 'package:flutter/material.dart';

import 'core/ui/theme/test_out_theme.dart';
import 'features/home/home_page.dart';
import 'features/profile/edit_profile_page.dart';
import 'features/profile/profile_controller.dart';

class OutApp extends StatelessWidget {
  const OutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbershop',
      debugShowCheckedModeBanner: false,
      theme: TestOutTheme.themeData,
      routes: {
        '/': (_) => const HomePage(),
      },
    );
  }
}
