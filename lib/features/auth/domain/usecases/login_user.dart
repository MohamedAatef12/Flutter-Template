import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:template/core/error/failure.dart';
import 'package:template/features/auth/domain/entities/login_entity.dart';
import 'package:template/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, LoginEntity>> call(LoginEntity loginData) {
    return repository.login(loginData);
  }
}
