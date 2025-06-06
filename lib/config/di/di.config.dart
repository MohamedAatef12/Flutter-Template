// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

import '../../data/network/api_services.dart' as _i655;
import '../../data/network/dio_factory.dart' as _i719;
import '../../features/auth/data/repos/auth_repository_impl.dart' as _i1006;
import '../../features/auth/data/sources/remote/auth_remote_datasource.dart'
    as _i1047;
import '../../features/auth/data/sources/remote/auth_remote_datasource_impl.dart'
    as _i119;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_user.dart' as _i778;
import '../../features/auth/domain/usecases/sign_up.dart' as _i190;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i207.Talker>(() => registerModule.talker);
    gh.lazySingleton<_i719.DioFactory>(() => registerModule.dioFactory);
    gh.factory<_i1047.AuthRemoteDataSource>(
      () => _i119.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i787.AuthRepository>(() => _i1006.AuthRepositoryImpl());
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i719.DioFactory>(), gh<_i207.Talker>()),
    );
    gh.factory<_i778.LoginUseCase>(
      () => _i778.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i190.SignUpUseCase>(
      () => _i190.SignUpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i655.ApiService>(() => _i655.ApiService(gh<_i361.Dio>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
