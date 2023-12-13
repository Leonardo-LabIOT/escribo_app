import 'package:escribo_app/components/book_card.dart';
import 'package:escribo_app/components/fetch_data.dart';
import 'package:escribo_app/components/nav_bar.dart';
import 'package:flutter/material.dart';

class _LibraryScreen extends StatelessWidget {
  final Future<List<dynamic>> fetchDataFuture;

  _LibraryScreen({required this.fetchDataFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Erro ao obter dados: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Nenhum livro encontrado.');
        } else {
          List<dynamic> books = snapshot.data!.toList();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Text("Escribo - Library",
                  style: TextStyle(color: Colors.white)),
            ),
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/1');
                  },
                  child: const Text('Push'),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(15),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 0.5,
                    ),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      var book = books[index];
                      return
                          // Hero(
                          // tag: 'book_${book['id']}',child:
                          BookCard(
                        id: book['id'],
                        title: book['title'],
                        author: book['author'],
                        url: book['download_url'],
                        imageUrl: book['cover_url'],
                        // ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchDataFuture = fetchData();
    return _LibraryScreen(fetchDataFuture: fetchDataFuture);
  }
}

// Future<List<dynamic>> fetchData() async {
//   try {
//     final response =
//         await http.get(Uri.parse('https://escribo.com/books.json'));
//     if (response.statusCode == 200) {
//       final List<dynamic> booksData = jsonDecode(response.body);

//       Set<int> uniqueIds = Set<int>();
//       List<dynamic> uniqueBooks = [];

//       for (var book in booksData) {
//         int id = book['id'];
//         if (!uniqueIds.contains(id)) {
//           uniqueIds.add(id);
//           uniqueBooks.add(book);
//         }
//       }
//       return uniqueBooks;
//     } else {
//       throw Exception('Erro no download de dados: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Erro ao obter dados: $e');
//     return []; // Retorna uma lista vazia em caso de erro
//   }
// }
