import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/error/failure.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/data/caching/secure_storage_helper.dart';
import 'package:template/data/caching/shared_prefs_helper.dart';
import 'package:template/features/auth/domain/usecases/login_user.dart';
import 'package:template/features/auth/domain/usecases/sign_up.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc(this.loginUseCase, this.signUpUseCase) : super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<LoginRequested>(_onLoginRequested);
  }
  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await signUpUseCase.call(event.user);

    await result.fold(
      (failure) async {
        emit(AuthFailure(failure));
      },
      (user) async {
        await SecureStorageHelper.write('email', user.email);
        await SecureStorageHelper.write('password', user.password);
        await SharedPrefsHelper.setBool('isSignedUp', true);
        AppLogger.info(
          'User signed up: ${user.email}, Token: ${user.password}',
        );
        emit(SignUpSuccess(user));
      },
    );
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await loginUseCase.call(event.loginEntity);

    await result.fold(
      (failure) async {
        emit(AuthFailure(failure));
      },
      (user) async {
        await SharedPrefsHelper.init();
        final storedEmail = await SecureStorageHelper.read('email');
        final storedPassword = await SecureStorageHelper.read('password');
        final isSignedUp = SharedPrefsHelper.getBool('isSignedUp') ?? false;

        if (!isSignedUp || storedEmail == null || storedPassword == null) {
          return;
        }

        if (user.email == storedEmail && user.password == storedPassword) {
          await SharedPrefsHelper.setBool('isLoggedIn', true);
          AppLogger.info('User logged in: ${user.email}');
          emit(LoginSuccess(user));
        } else {
          AppLogger.error('Login failed: Invalid credentials');
          emit(AuthFailure(ServerFailure('Login failed: Invalid credentials')));
        }
      },
    );
  }
}
