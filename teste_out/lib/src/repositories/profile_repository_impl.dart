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
  Future<Either<RepositoryException, Nil>> editProfile(Profile profile) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<RepositoryException, Profile>> findProfile() {
    // TODO: implement findProfile
    throw UnimplementedError();
  }
}
