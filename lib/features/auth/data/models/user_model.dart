import 'package:blog_app/core/common/entities/user.dart';

class UserModel extends User {
  UserModel({required super.name, required super.id, required super.email});
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"] ?? "",
      id: map["id"] ?? "",
      email: map["email"] ?? "",
    );
  }
  UserModel copyWith({
    String? name,
    String? id,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }
}
