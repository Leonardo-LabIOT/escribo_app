import 'dart:convert';
import 'package:http/http.dart' as http;

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
