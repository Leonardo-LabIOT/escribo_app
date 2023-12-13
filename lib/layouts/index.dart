import 'package:flutter/material.dart';
import 'package:escribo_app/views/home_page.dart';

class AppTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/library',
      routes: {
        '/library': (context) => HomePage(title: 'Library'),
        '/favorites': (context) => HomePage(title: 'Favorites'),
      },
    );
  }
}
