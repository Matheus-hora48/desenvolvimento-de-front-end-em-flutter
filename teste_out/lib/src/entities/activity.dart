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
}
