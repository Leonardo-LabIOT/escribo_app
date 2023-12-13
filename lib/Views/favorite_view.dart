// import 'package:escribo_app/components/book_card.dart';
// import 'package:escribo_app/components/fetch_data.dart';
// import 'package:escribo_app/components/nav_bar.dart';
// import 'package:flutter/material.dart';

// class FavoriteScreen extends StatelessWidget {
//   FavoriteScreen();

//   @override
//   Widget build(BuildContext context) {
//     return _FavoriteScreen();
//   }
// }

// class _FavoriteScreen extends StatelessWidget {
//   _FavoriteScreen();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>>(
//       future: fetchData(),
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
//           List<dynamic> favoriteBooks = [];
//           // books.where((book) => future.contains(book['id'])).toList();

//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.blueAccent,
//               title: Text("Escribo - Favorites",
//                   style: TextStyle(color: Colors.white)),
//             ),
//             body: GridView.builder(
//               key: key,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 5.0,
//                 mainAxisSpacing: 5.0,
//                 childAspectRatio: 0.5,
//               ),
//               itemCount: favoriteBooks.length,
//               itemBuilder: (context, index) {
//                 var book = favoriteBooks[index];
//                 return Hero(
//                   tag:  book['id'],
//                   child: BookCard(
//                     id: book['id'],
//                     title: book['title'],
//                     author: book['author'],
//                     url: book['download_url'],
//                     imageUrl: book['cover_url'],
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }
