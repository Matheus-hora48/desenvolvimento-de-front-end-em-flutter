class Moderator {
  Moderator({
    required this.id,
    required this.name,
    required this.createAt,
    required this.updateAt,
  });

  final int id;
  final String name;
  final DateTime createAt;
  final DateTime updateAt;

  factory Moderator.fromJson(Map<String, dynamic> json) {
    return Moderator(
      id: json['id'],
      name: json['name'],
      createAt: DateTime.parse(json['createAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createAt': createAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
    };
  }
}
