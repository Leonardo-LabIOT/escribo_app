// favorite_view.dart
import 'package:flutter/material.dart';
import 'package:escribo_app/components/book_card.dart';
import 'package:escribo_app/components/fetch_data.dart';

class _FavoriteScreen extends StatelessWidget {
  final Future<List<dynamic>> fetchDataFuture;

  _FavoriteScreen({required this.fetchDataFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: Text("ERROR", style: TextStyle(color: Colors.white)),
              ),
              body: Center(
                  child: Text('Erro ao obter dados: ${snapshot.error}')));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: Text("Escribo - Library",
                    style: TextStyle(color: Colors.white)),
              ),
              body: Center(
                child: Text(
                  'Nenhum Livro Favorito!',
                  style: TextStyle(fontSize: 32),
                ),
              ));
        } else {
          List<dynamic> books = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Text("Escribo - Library",
                  style: TextStyle(color: Colors.white)),
            ),
            body: (books.length > 0)
                ? Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.all(15),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 0.5,
                          ),
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            var book = books[index];
                            return BookCard(
                              id: book['id'],
                              title: book['title'],
                              author: book['author'],
                              url: book['download_url'],
                              imageUrl: book['cover_url'],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(child: Text("Nenhum Favorito")),
          );
        }
      },
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen();

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchDataFuture =
        fetchDataFavorites(); // Certifique-se de implementar fetchDataFavorites corretamente
    return _FavoriteScreen(fetchDataFuture: fetchDataFuture);
  }
}
