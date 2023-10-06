import 'package:flutter/material.dart';
import 'package:teste_out/src/core/fp/either.dart';

import '../../entities/profile.dart';
import '../../repositories/profile_repository.dart';
import 'profile_singleton.dart';

enum ProfileStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileController {
  final ValueNotifier<ProfileStateStatus> statusNotifier = ValueNotifier(
    ProfileStateStatus.initial,
  );

  ProfileSingleton singleton = ProfileSingleton();

  String? errorMessage = '';

  Profile? _profile;

  ProfileStateStatus get status => statusNotifier.value;
  Profile? get profile => _profile;

  final ProfileRepositoryInterface _repository;

  ProfileController(this._repository);

  Future<void> findProfile() async {
    statusNotifier.value = ProfileStateStatus.loading;
    final result = await _repository.findProfile();

    switch (result) {
      case Success(value: final profile):
        _profile = profile;
        statusNotifier.value = ProfileStateStatus.loaded;
        break;
      case Failure(:final exception):
        errorMessage = exception.toString();
        statusNotifier.value = ProfileStateStatus.error;
        break;
    }
  }

  Future<void> editProfile(Profile profile) async {
    statusNotifier.value = ProfileStateStatus.loading;
    final result = await _repository.editProfile(profile);

    switch (result) {
      case Success():
        _profile = profile;
        singleton.updateProfile(profile);
        statusNotifier.value = ProfileStateStatus.loaded;
        break;
      case Failure(:final exception):
        errorMessage = exception.toString();
        statusNotifier.value = ProfileStateStatus.error;
        break;
    }
  }
}
