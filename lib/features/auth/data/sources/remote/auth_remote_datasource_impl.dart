import 'package:injectable/injectable.dart';
import 'package:template/features/auth/data/models/user_model.dart';
import 'package:template/features/auth/data/sources/remote/auth_remote_datasource.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> signUp(UserModel user) async {
    // API call simulation
    await Future.delayed(Duration(seconds: 2));
  }
}
