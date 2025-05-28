import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:template/core/error/failure.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) {
    return repository.signUp(user);
  }
}
