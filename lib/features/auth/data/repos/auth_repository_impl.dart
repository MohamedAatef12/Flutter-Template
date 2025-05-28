import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:template/core/error/error_handler.dart';
import 'package:template/core/error/failure.dart';
import 'package:template/features/auth/data/models/login_model.dart';
import 'package:template/features/auth/data/models/user_model.dart';
import 'package:template/features/auth/domain/entities/login_entity.dart';
import 'package:template/features/auth/domain/entities/user_entity.dart';
import 'package:template/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> signUp(UserEntity user) async {
    try {
      final userModel = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
        phone: user.phone,
      );
      await Future.delayed(Duration(seconds: 2));

      return Right(userModel);
    } catch (e) {
      // Handle error
      final failure = ErrorHandler.handle(e as Exception);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> login(LoginEntity loginData) async {
    try {
      final loginModel = LoginModel(
        email: loginData.email,
        password: loginData.password,
      );

      // Simulate network call or call your API here
      await Future.delayed(Duration(seconds: 2));

      return Right(loginModel);
    } catch (e) {
      final failure = ErrorHandler.handle(e as Exception);
      return Left(failure);
    }
  }
}
