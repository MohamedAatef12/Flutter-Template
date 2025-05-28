import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp(UserModel user);
}
