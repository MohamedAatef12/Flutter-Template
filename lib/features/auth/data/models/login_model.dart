import 'package:template/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.email, required super.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  LoginModel.fromEntity(LoginEntity loginEntity)
    : super(email: loginEntity.email, password: loginEntity.password);

  LoginEntity toEntity(LoginModel loginModel) =>
      LoginEntity(email: loginModel.email, password: loginModel.password);
}
