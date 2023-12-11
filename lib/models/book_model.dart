class Book_Model {
  String id;
  String title;
  String author;
  String cover_url;
  String download_url;

  Book_Model({
    required this.author,
    required this.cover_url,
    required this.download_url,
    required this.id,
    required this.title,
  });
  // Book_Model.fromJson(Map<String, dynamic> json) {
  //   id = json["id"];
  //   title = json["title"];
  //   author = json["author"];
  //   cover_url = json["cover_url"];
  //   download_url = json["download_url"];
  // };
}
