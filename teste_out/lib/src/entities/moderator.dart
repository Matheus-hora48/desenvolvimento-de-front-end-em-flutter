
class Moderator {
  Moderator({
    required this.id,
    required this.name,
    required this.createAt,
    required this.updateAt
  });
  final int id;
  final String name;
  final DateTime createAt;
  final DateTime updateAt;
}