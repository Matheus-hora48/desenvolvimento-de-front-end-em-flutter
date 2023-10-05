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
  final String phone;
  final String email;
  final String location;
  final List<Building> buildings;
  final List<OpeningHour> openingHours;
  final DateTime createAt;
  DateTime updateAt;
}
