import 'package:escribo_app/components/book_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class _LibraryScreen extends StatelessWidget {
  final Future<List<dynamic>> fetchDataFuture;

  _LibraryScreen({required this.fetchDataFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Enquanto aguarda a conclusão do futuro, você pode exibir um indicador de carregamento
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Se ocorrer um erro ao obter os dados, você pode exibir uma mensagem de erro
          return Text('Erro ao obter dados: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Se não houver dados ou os dados estiverem vazios, você pode exibir uma mensagem correspondente
          return Text('Nenhum livro encontrado.');
        } else {
          // Se os dados estiverem disponíveis, construa o ListView
          List<dynamic> books = snapshot.data!.toList();
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  imageUrl: book[
                      'cover_url'] // Substitua com a chave correta para a URL da imagem
                  );
            },
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

Future<List<dynamic>> fetchData() async {
  try {
    final response =
        await http.get(Uri.parse('https://escribo.com/books.json'));
    if (response.statusCode == 200) {
      final List<dynamic> booksData = jsonDecode(response.body);

      Set<int> uniqueIds = Set<int>();
      List<dynamic> uniqueBooks = [];

      for (var book in booksData) {
        int id = book['id'];
        if (!uniqueIds.contains(id)) {
          uniqueIds.add(id);
          uniqueBooks.add(book);
        }
      }
      return uniqueBooks;
    } else {
      throw Exception('Erro no download de dados: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao obter dados: $e');
    return []; // Retorna uma lista vazia em caso de erro
  }
}
