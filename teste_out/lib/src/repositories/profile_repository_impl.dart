import 'dart:developer';

import 'package:teste_out/src/core/exception/repository_exception.dart';
import 'package:teste_out/src/core/fp/either.dart';
import 'package:teste_out/src/core/fp/nil.dart';
import 'package:teste_out/src/dto/dto_interface.dart';
import 'package:teste_out/src/entities/profile.dart';
import 'package:teste_out/src/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepositoryInterface {
  final DtoInterface bankMock;

  ProfileRepositoryImpl(this.bankMock);

  @override
  Future<Either<RepositoryException, Nil>> editProfile(Profile profile) async {
    try {
      Profile profileMock = await bankMock.selectProfile();

      profileMock.name = profile.name;
      profileMock.bio = profile.bio;
      profileMock.photo = profile.photo;
      profileMock.location = profile.location;
      profileMock.administratorGeneral = profile.administratorGeneral;
      profileMock.moderators = profile.moderators;
      profileMock.activities = profile.activities;
      profileMock.about = profile.about;
      profileMock.updateAt = profile.updateAt;

      return Success(Nil());
    } on ArgumentError catch (e, s) {
      log('Json inválido', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Json inválido'),
      );
    }
  }

  @override
  Future<Either<RepositoryException, Profile>> findProfile() async {
    try {
      Profile profileMock = await bankMock.selectProfile();
      return Success(profileMock);
    } on ArgumentError catch (e, s) {
      log('Json inválido', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Json inválido'),
      );
    }
  }
}
