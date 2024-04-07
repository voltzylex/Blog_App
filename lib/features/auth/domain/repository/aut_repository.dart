import "package:blog_app/core/error/failure.dart";
import "package:blog_app/core/common/entities/user.dart";
// ignore: depend_on_referenced_packages
import "package:fpdart/fpdart.dart";

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> loginInWithEmailPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure,User>> getCurrentUser();
}
