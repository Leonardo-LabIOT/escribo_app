import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteButton extends StatefulWidget {
  final int id;
  final VoidCallback onFavoriteChanged;

  const FavoriteButton({
    Key? key,
    required this.id,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = false;
    super.initState();
    loadFavoriteState();
  }

  Future<void> loadFavoriteState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool('favorite_${widget.id}') ?? false;
    });
  }

  void saveFavoriteState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('favorite_${widget.id}', isFavorite);
    widget.onFavoriteChanged(); // Notificar que o estado de favorito mudou
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
          saveFavoriteState();
        });
      },
      child: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        size: 48,
        color: isFavorite ? Colors.amber[300] : Colors.black,
      ),
    );
  }
}
