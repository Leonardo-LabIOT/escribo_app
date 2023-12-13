import 'package:escribo_app/components/book_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Favorites");
  }
}

// class FavoriteScreen extends StatelessWidget {
//   final Future<List<dynamic>> fetchDataFuture;
//   final Set<int> favoriteList; // Adicionando a lista de favoritos

//   FavoriteScreen({required this.fetchDataFuture, required this.favoriteList});

//   @override
//   Widget build(BuildContext context) {
//     return _LibraryScreen(
//         fetchDataFuture: fetchDataFuture, favoriteList: favoriteList);
//   }
// }

// class _LibraryScreen extends StatelessWidget {
//   final Future<List<dynamic>> fetchDataFuture;
//   final Set<int> favoriteList; // Adicionando a lista de favoritos

//   _LibraryScreen({required this.fetchDataFuture, required this.favoriteList});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>>(
//       future: fetchDataFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Text('Erro ao obter dados: ${snapshot.error}');
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Text('Nenhum livro encontrado.');
//         } else {
//           List<dynamic> books = snapshot.data!.toList();
//           // Filtrando apenas os livros que estão na lista de favoritos
//           List<dynamic> favoriteBooks =
//               books.where((book) => favoriteList.contains(book['id'])).toList();

//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 5.0,
//               mainAxisSpacing: 5.0,
//               childAspectRatio: 0.5,
//             ),
//             itemCount: favoriteBooks.length,
//             itemBuilder: (context, index) {
//               var book = favoriteBooks[index];
//               return BookCard(
//                 id: book['id'],
//                 title: book['title'],
//                 author: book['author'],
//                 url: book['download_url'],
//                 imageUrl: book['cover_url'],
//                 isFavorite: favoriteList.contains(
//                     book['id']), // Verifica se está na lista de favoritos
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
