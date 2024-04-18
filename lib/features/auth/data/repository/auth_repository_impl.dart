import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/network/connection_checker.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/aut_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show AuthException;

class AuthRepositoryImpl implements AuthRepository {
  // AuthRemoteDataSourceImpl
  final AuthRemoteDataSource remoteDataSource;
  final ConnectionCheckerImpl connectionChecker;
  const AuthRepositoryImpl(this.remoteDataSource, this.connectionChecker);
  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUserData();
      if (user != null) {
        return right(user);
      } else {
        return left(Failure("User is Not Logged in"));
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> loginInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.loginInWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    // try {
    //   final userId = await remoteDataSource.signUpWithEmailPassword(name: name, email: email, password: password);
    //   return right(userId);
    // } on ServerException catch (e) {
    //   return left(Failure(e.message));
    // }
    return _getUser(
      () async => await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no Internet Connection"));
      }
      final userId = await fn();
      return right(userId);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
