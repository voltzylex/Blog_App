import "dart:developer";

import "package:blog_app/core/error/exceptions.dart";
import "package:blog_app/features/auth/data/models/user_model.dart";
import "package:supabase_flutter/supabase_flutter.dart";

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginInWithEmailPassword({
    required String email,
    required String password,
  });

  /// get current user data from the session
  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  // TODO: implement currentUserSession
  Session? get currentUserSession => client.auth.currentSession;

  /// Auth Remote Data Source Impl used for Login with password
  @override
  Future<UserModel> loginInWithEmailPassword({required String email, required String password}) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      log("Auth remove data Source ${response.user}");
      if (response.user == null) {
        throw const ServerException(message: "User is Null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      log("Auth remove data Source $e");
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String name, required String email, required String password}) async {
    try {
      final response = await client.auth.signUp(email: email, password: password, data: {"name": name});
      log("Auth remove data Source ${response.user}");
      if (response.user == null) {
        throw const ServerException(message: "User is Null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      log("Auth remove data Source $e");
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await client.from("profiles").select().eq(
              "id",
              currentUserSession!.user.id,
            );
        return UserModel.fromJson(userData.first);
      }
      return null;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
