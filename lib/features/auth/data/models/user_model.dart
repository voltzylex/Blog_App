import 'package:blog_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.name, required super.id, required super.email});
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"] ?? "",
      id: map["id"] ?? "",
      email: map["email"] ?? "",
    );
  }
}
