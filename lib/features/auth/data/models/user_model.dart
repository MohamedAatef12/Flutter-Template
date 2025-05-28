import 'package:template/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.password,
    required super.phone,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
  };
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );
  }
  UserModel.fromEntity(UserEntity userEntity)
    : super(
        name: userEntity.name,
        email: userEntity.email,
        password: userEntity.password,
        phone: userEntity.phone,
      );
  UserEntity toEntity(UserModel userModel) => UserEntity(
    name: userModel.name,
    email: userModel.email,
    password: userModel.password,
    phone: userModel.phone,
  );
}
