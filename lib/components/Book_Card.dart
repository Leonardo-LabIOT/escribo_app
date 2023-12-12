import 'package:escribo_app/components/favorite_button.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final int id;
  final String title;
  final String author;
  final String imageUrl;

  BookCard({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 5,
      child: Container(
        width: 130, // Largura fixa do Card
        height: 255, // Altura fixa do Card
        child: Stack(
          children: [
            // Exibindo a imagem do livro
            Positioned(
              child: Image.network(
                imageUrl,
                width: 130,
                // fit: BoxFit.fitWidth,
              ),
            ),

            // Exibindo informações do livro
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título com quebra de linha se necessário
                    Text(
                      title,
                      maxLines: 2, // Definindo o número máximo de linhas
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    // Autor com quebra de linha se necessário
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
              // elevation:8,
              top: 0,
              right: 7,
              child: FavoriteButton(id: id, onFavoriteChanged: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
