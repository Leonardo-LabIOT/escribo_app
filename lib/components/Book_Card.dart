import 'package:escribo_app/Views/reader_view.dart';
import 'package:escribo_app/components/favorite_button.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final String url;

  BookCard({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      // child: GestureDetector(
        // onTap: () {
          // print('Card Clicado - ID: $id');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ReaderScreen(
          //       id: id,
          //       title: title,
          //       url: url,
          //     ),
          //   ),
          // );
        // },
        // child: Container(
          width: 130,
          height: 255,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Author: $author',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 7,
                child: FavoriteButton(id: id, onFavoriteChanged: () {}),
              ),
            ],
          ),
        // ),
      // ),
    );
  }
}
