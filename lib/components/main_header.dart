import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Scribo Header", style: TextStyle(color: Colors.white)),
            // Adicione mais widgets se necessário
          ],
        ),
      ),
      // Adicione outras propriedades da AppBar conforme necessário
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Defina a altura desejada
}
