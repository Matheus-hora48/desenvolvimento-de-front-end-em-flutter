
import 'about.dart';
import 'activity.dart';
import 'moderator.dart';

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.bio,
    required this.photo,
    required this.location,
    required this.administratorGeneral,
    required this.moderators,
    required this.activities,
    required this.about,
    required this.createAt,
    required this.updateAt,
  });

  final int id;
  final String name;
  final String bio;
  final String photo;
  final String location;
  final String administratorGeneral;
  final List<Moderator> moderators;
  final List<Activity> activities;
  final About about;
  final DateTime createAt;
  DateTime updateAt;


}