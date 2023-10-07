class Building {
  Building({
    required this.id,
    required this.name,
    required this.photo,
    required this.administrator,
    required this.createAt,
    required this.updateAt,
  });

  final int id;
  String name;
  final String photo;
  String administrator;
  final DateTime createAt;
  DateTime updateAt;

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      administrator: json['administrator'],
      createAt: DateTime.parse(json['createAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'administrator': administrator,
      'createAt': createAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
    };
  }
}
