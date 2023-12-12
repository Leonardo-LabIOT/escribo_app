import 'dart:convert';
import 'package:escribo_app/Views/index.dart';
import 'package:escribo_app/components/main_header.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String page = "Library";
  goFavorites() {
    page = "Favorites";
    print(page);
  }

  goLibrary() {
    page = "Library";
    print(page);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Scribo Header", style: TextStyle(color: Colors.white)),
              Row(
                children: [
                  TextButton(
                      onPressed: goLibrary,
                      child: Text("Library",
                          style: TextStyle(color: Colors.white))),
                  TextButton(
                      onPressed: goFavorites,
                      child: Text("Favorites",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            ],
          ),
        ),
      ),
      body: HomePage(title: page),
    ));
  }
}
