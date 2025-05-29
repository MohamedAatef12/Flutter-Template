import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/config/di/di.dart';
import 'package:template/config/router/routes.dart';
import 'package:template/features/auth/domain/usecases/login_user.dart';
import 'package:template/features/auth/domain/usecases/sign_up.dart';
import 'package:template/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:template/features/auth/presentation/pages/login_page.dart';
import 'package:template/features/auth/presentation/pages/register_page.dart';
import 'package:template/features/home/presentation/pages/home_page.dart';

import 'guards.dart';

GoRouter appRouter() => GoRouter(
  initialLocation: AppRoutes.login,
  redirect: (context, state) async {
    final isSignedUp = await AuthService.hasSignedUp();
    final isLoggedIn = await AuthService.checkAuth();

    final goingToLogin = state.uri.toString() == AppRoutes.login;
    final goingToSignUp = state.uri.toString() == AppRoutes.signUp;

    if (!isSignedUp && !goingToSignUp) {
      return AppRoutes.signUp;
    }

    if (isSignedUp && !isLoggedIn && !goingToLogin) {
      return AppRoutes.login;
    }

    if (isLoggedIn && (goingToLogin || goingToSignUp)) {
      return AppRoutes.home;
    }

    return null;
  },
  routes: <RouteBase>[
    // GoRoute(
    //   path: '/',
    //   name: 'splash',
    //   builder: (context, state) => const SplashScreen(),
    // ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRouteNames.login,
      builder:
          (context, state) => BlocProvider(
            create:
                (context) =>
                    AuthBloc(getIt<LoginUseCase>(), getIt<SignUpUseCase>()),
            child: const LoginPage(),
          ),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      name: AppRouteNames.signUp,
      builder:
          (context, state) => BlocProvider(
            create:
                (context) =>
                    AuthBloc(getIt<LoginUseCase>(), getIt<SignUpUseCase>()),
            child: const SignUpPage(),
          ),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRouteNames.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
