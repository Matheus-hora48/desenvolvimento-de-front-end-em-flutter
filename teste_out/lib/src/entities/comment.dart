class Comment {
  Comment({
    required this.id,
    required this.author,
    required this.content,
    required this.createAt,
    required this.updateAt,
  });

  final int id;
  final String author;
  final String content;
  final DateTime createAt;
  final DateTime updateAt;
}
