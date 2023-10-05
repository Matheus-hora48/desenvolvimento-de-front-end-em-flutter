
class Building {
  Building({
    required this.id,
    required this.name,
    required this.photo,
    required this.administrator,
    required this.createAt,
    required this.updateAt
  });
  final int id;
  final String name;
  final String photo;
  final String administrator;
  final DateTime createAt;
  DateTime updateAt;
}