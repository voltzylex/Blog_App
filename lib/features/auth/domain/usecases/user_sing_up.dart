// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/domain/repository/aut_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/usercase.dart';
import 'package:fpdart/fpdart.dart';


class UserSignUp implements UserCase<String, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;
  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
