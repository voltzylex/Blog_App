import "package:blog_app/core/error/failure.dart";
// ignore: depend_on_referenced_packages
import "package:fpdart/fpdart.dart";

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> loginInWithEmailPassword({
    required String email,
    required String password,
  });
}
