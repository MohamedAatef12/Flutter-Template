import 'package:equatable/equatable.dart';
import 'package:template/features/auth/domain/entities/login_entity.dart';
import 'package:template/features/auth/domain/entities/user_entity.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpRequested extends AuthEvent {
  final UserEntity user;

  SignUpRequested(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginRequested extends AuthEvent {
  LoginEntity loginEntity;
  LoginRequested(this.loginEntity);

  @override
  List<Object?> get props => [loginEntity];
}
