import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scribo Reader App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: BookScreen(),
    );
  }
}

class BookCard extends StatefulWidget {
  final String title;
  final String author;
  final String img;
  final String url;

  BookCard({
    required this.title,
    required this.author,
    required this.img,
    required this.url,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isFavorite ? Colors.red[900] : Colors.blueAccent,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            widget.img,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
          ),
          Positioned(
            top: 3,
            right: 3,
            width: 30,
            height: 40,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    0), // Ajuste o raio conforme necessário
              ),
              backgroundColor: !isFavorite ? Colors.white : Colors.amber[900],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              widget.title, // Use widget.title para acessar o título
              style: TextStyle(color: isFavorite ? Colors.green : Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class BookScreen extends StatefulWidget {
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Future<List<dynamic>>? _futureBooks;

  @override
  void initState() {
    super.initState();
    _futureBooks = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text("my Books"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro ao obter dados: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('Nenhum livro encontrado.');
          } else {
            List<dynamic> books = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                var book = books[index];
                return BookCard(
                  title: book['title'],
                  author: book['author'],
                  img: book['cover_url'],
                  url: book['download_url'],
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<dynamic>> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://escribo.com/books.json'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        print(jsonData);
        return jsonData;
        // await saveDB(jsonData);
        // return readDB();
      } else {
        throw Exception('Erro no download de dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao obter dados: $e');
      return [];
    }
  }

  Future<void> saveDB(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var book in data) {
      await prefs.setString('book${book["id"]}', jsonEncode(book));
      print('book${book["id"]} : $book :');
    }
  }

  Future<List<dynamic>> readDB() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = 1;
    List<dynamic> books = [];
    while (id > 0) {
      try {
        var _aux = prefs.getString('book$id');
        if (_aux != null) {
          id++;
          books.add(jsonDecode(_aux));
        } else {
          break;
        }
      } catch (e) {
        id = -1;
        print('Erro ao ler dados do DB: $e');
      }
    }
    return books;
  }
}
