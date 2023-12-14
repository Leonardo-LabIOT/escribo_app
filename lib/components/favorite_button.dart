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
  late bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    loadFavoriteState();
  }

  Future<void> loadFavoriteState() async {
    bool favorite = await getFavorite(widget.id);
    setState(() {
      isFavorite = favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
          setFavorite(widget.id, isFavorite);
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

Future<bool> getFavorite(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('favorite_$id') ?? false;
}

Future<void> setFavorite(int id, bool isFavorite) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('favorite_$id', isFavorite);
}
