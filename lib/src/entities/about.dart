import 'building.dart';
import 'opening_hour.dart';

class About {
  About({
    required this.id,
    required this.phone,
    required this.email,
    required this.location,
    required this.buildings,
    required this.openingHours,
    required this.createAt,
    required this.updateAt,
  });

  final int id;
  String phone;
  String email;
  String location;
  final List<Building> buildings;
  final List<OpeningHour> openingHours;
  final DateTime createAt;
  final DateTime updateAt;
  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      id: json['id'],
      phone: json['phone'],
      email: json['email'],
      location: json['location'],
      buildings: (json['buildings'] as List<dynamic>)
          .map((building) => Building.fromJson(building))
          .toList(),
      openingHours: (json['openingHours'] as List<dynamic>)
          .map((openingHour) => OpeningHour.fromJson(openingHour))
          .toList(),
      createAt: DateTime.parse(json['createAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'email': email,
      'location': location,
      'buildings': buildings.map((building) => building.toJson()).toList(),
      'openingHours':
          openingHours.map((openingHour) => openingHour.toJson()).toList(),
      'createAt': createAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
    };
  }
}
