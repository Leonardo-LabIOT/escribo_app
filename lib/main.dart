import 'package:escribo_app/Views/favorite_view.dart';
import 'package:escribo_app/Views/library_view.dart';
import 'package:escribo_app/Views/reader_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Escribo Reader',
      initialRoute: '/library',
      routes: {
        '/library': (context) => LibraryScreen(),
        '/favorites': (context) => FavoriteScreen(),
        '/reader': (context) => ReaderScreen(
            id: 3,
            title: "Mythen en sagen uit West-Indië",
            url: "https://www.gutenberg.org/ebooks/72126.epub.noimages"),
      },
    ),
  );
}
