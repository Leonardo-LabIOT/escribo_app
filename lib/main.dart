import 'package:escribo_app/components/main_header.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'layouts/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scribo App',
      home: Scaffold(
        appBar: MainHeader(),
        body: AppTemplate(),
      ),
    );
  }
}
