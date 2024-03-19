import "package:blog_app/core/error/exceptions.dart";
import "package:supabase_flutter/supabase_flutter.dart";

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<String> loginInWithEmailPassword({required String email, required String password}) {

    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword(
      {required String name, required String email, required String password}) async {
    try {
      final response = await client.auth.signUp(email: email, password: password, data: {"name": name});
      if (response.user == null) {
        throw const ServerException(message: "User is Null");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
