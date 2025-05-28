import 'package:dartz/dartz.dart';
import 'package:template/core/error/failure.dart';
import 'package:template/features/auth/domain/entities/login_entity.dart';
import 'package:template/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp(UserEntity user);
  Future<Either<Failure, LoginEntity>> login(LoginEntity loginData);
}
