import 'package:flutter/material.dart';
import 'package:template/config/env/app_config.dart';
import 'package:template/config/router/app_router.dart';

class MyApp extends StatelessWidget {
  final AppConfig appConfig;

  const MyApp({super.key, required this.appConfig});

  @override
  Widget build(BuildContext context) {
    final router = appRouter();
    final isDev = appConfig.envName == 'Development';
    return MaterialApp.router(
      title: 'Flutter ${appConfig.envName}',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: isDev ? Colors.orange : Colors.blue,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
