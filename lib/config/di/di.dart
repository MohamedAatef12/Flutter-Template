import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:template/config/di/di.config.dart';
import 'package:template/data/network/dio_factory.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Talker get talker => TalkerFlutter.init();

  @lazySingleton
  DioFactory get dioFactory => DioFactory();

  @lazySingleton
  Dio dio(DioFactory dioFactory, Talker talker) => dioFactory.createDio(talker);
}
