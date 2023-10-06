import '../../entities/profile.dart';

class ProfileSingleton {
  static final ProfileSingleton _instance = ProfileSingleton._internal();

  factory ProfileSingleton() {
    return _instance;
  }

  ProfileSingleton._internal();

  Profile? _profile;

  Profile? get profile => _profile;

  void updateProfile(Profile newProfile) {
    _profile = newProfile;
  }
}
