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

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      author: json['author'],
      content: json['content'],
      createAt: DateTime.parse(json['createAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'content': content,
      'createAt': createAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
    };
  }
}
