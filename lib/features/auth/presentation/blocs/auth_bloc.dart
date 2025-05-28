import 'package:flutter_bloc/flutter_bloc.dart';
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

    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(SignUpSuccess(user)),
    );
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await loginUseCase.call(event.loginEntity);

    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
