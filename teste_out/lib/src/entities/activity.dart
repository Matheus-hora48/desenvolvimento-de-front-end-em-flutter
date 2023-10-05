import 'comment.dart';

class Activity {
  Activity({
    required this.id,
    required this.author,
    required this.content,
    required this.comments,
    required this.createAt,
    required this.updateAt,
  });

  final int id;
  final String author;
  final String content;
  final List<Comment> comments;
  final DateTime createAt;
  final DateTime updateAt;

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      author: json['author'],
      content: json['content'],
      comments: (json['comments'] as List<dynamic>)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
      createAt: DateTime.parse(json['createAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'content': content,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'createAt': createAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
    };
  }
}
