import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/aut_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/usercase.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser implements UserCase<User, NoParams> {
  AuthRepository repository;
  CurrentUser({required this.repository});
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
return    await repository.getCurrentUser();

  }
}
