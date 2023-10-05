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
  String name;
  String bio;
  String photo;
  String location;
  String administratorGeneral;
  List<Moderator> moderators;
  List<Activity> activities;
  About about;
  final DateTime createAt;
  DateTime updateAt;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      photo: json['photo'],
      location: json['location'],
      administratorGeneral: json['administratorGeneral'],
      moderators: (json['moderators'] as List<dynamic>)
          .map((moderator) => Moderator.fromJson(moderator))
          .toList(),
      activities: (json['activities'] as List<dynamic>)
          .map((activity) => Activity.fromJson(activity))
          .toList(),
      about: About.fromJson(json['about']),
      createAt: DateTime.parse(json['createAt']),
      updateAt: DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'photo': photo,
      'location': location,
      'administratorGeneral': administratorGeneral,
      'moderators': moderators.map((moderator) => moderator.toJson()).toList(),
      'activities': activities.map((activity) => activity.toJson()).toList(),
      'about': about.toJson(),
      'createAt': createAt.toIso8601String(),
      'updateAt': updateAt.toIso8601String(),
    };
  }
}
