import "package:blog_app/core/error/failure.dart";
import "package:blog_app/features/auth/domain/entities/user.dart";
// ignore: depend_on_referenced_packages
import "package:fpdart/fpdart.dart";

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> loginInWithEmailPassword({
    required String email,
    required String password,
  });
}
