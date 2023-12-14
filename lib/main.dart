import 'package:escribo_app/Views/favorite_view.dart';
import 'package:escribo_app/Views/library_view.dart';
import 'package:escribo_app/Views/reader_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  // WidgetsFlutterBinding
  //     .ensureInitialized(); // Certifique-se de inicializar os bindings.

  // Solicitar permissão de armazenamento
  // var status = await Permission.storage.request();

  // if (status.isGranted) {
  // print('A permissão de armazenamento foi garantida pelo usuário.');
  runApp(
    MaterialApp(
      title: 'Escribo Reader',
      initialRoute: '/library',
      routes: {
        '/library': (context) => LibraryScreen(),
        '/favorites': (context) => FavoriteScreen(),
        '/reader': (context) => ReaderScreen(id: 99, title: "", url: ""),
      },
    ),
  );
  // } else if (status.isDenied) {
  //   // O usuário negou a permissão. Trate isso de acordo.
  //   // Pode ser útil mostrar uma mensagem ao usuário.
  //   print('A permissão de armazenamento foi negada pelo usuário.');
  // } else if (status.isPermanentlyDenied) {
  //   // O usuário negou permanentemente a permissão.
  //   // Pode ser útil redirecionar o usuário para as configurações do aplicativo.
  //   print('O usuário negou permanentemente a permissão de armazenamento.');
  // }
}
