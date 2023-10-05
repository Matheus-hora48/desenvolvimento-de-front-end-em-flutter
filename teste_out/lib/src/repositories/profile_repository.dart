import '../core/exception/repository_exception.dart';
import '../core/fp/either.dart';
import '../core/fp/nil.dart';
import '../entities/profile.dart';

abstract interface class ProfileRepositoryInterface {
  Future<Either<RepositoryException, Profile>> findProfile();
  Future<Either<RepositoryException, Nil>> editProfile(Profile profile);
}
