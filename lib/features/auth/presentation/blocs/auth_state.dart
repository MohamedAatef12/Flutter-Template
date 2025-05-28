import 'package:equatable/equatable.dart';
import 'package:template/core/error/failure.dart';
import 'package:template/features/auth/domain/entities/login_entity.dart';
import 'package:template/features/auth/domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

// Success states
class SignUpSuccess extends AuthState {
  final UserEntity user;

  SignUpSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginSuccess extends AuthState {
  final LoginEntity loginEntity;

  LoginSuccess(this.loginEntity);

  @override
  List<Object?> get props => [loginEntity];
}

class AuthFailure extends AuthState {
  final Failure failure;

  AuthFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
