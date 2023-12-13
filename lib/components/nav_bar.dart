import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/library');
              },
              child: Text("Library", style: TextStyle(color: Colors.white))),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/favorites');
              },
              child: Text("Favorites", style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
