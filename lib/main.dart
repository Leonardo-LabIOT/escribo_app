import 'package:escribo_app/Views/favorite_view.dart';
import 'package:escribo_app/Views/library_view.dart';
import 'package:escribo_app/Views/reader_view.dart';
import 'package:escribo_app/components/main_header.dart';
import 'package:escribo_app/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Escribo Reader',
      initialRoute: '/1',
      routes: {
        '/1': (context) => FirstScreen(),
        '/2': (context) => SecondScreen(),
        '/library': (context) => LibraryScreen(),
        // '/favorites': (context) => FavoriteScreen(),
        '/reader': (context) => ReaderScreen(
            id: 3,
            title: "Mythen en sagen uit West-Indië",
            url: "https://www.gutenberg.org/ebooks/72126.epub.noimages"),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escribo'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/library');
              },
              child: const Text('Push'),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escribo'),
      ),
      body: Column(
        children: [
          NavBar(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/favorites');
              },
              child: const Text('Push'),
            ),
          ),
        ],
      ),
    );
  }
}
