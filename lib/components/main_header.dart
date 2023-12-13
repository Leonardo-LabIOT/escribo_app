import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Center(
          child: Text("Escribo Header", style: TextStyle(color: Colors.white))),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
