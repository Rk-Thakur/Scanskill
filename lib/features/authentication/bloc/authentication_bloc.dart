import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/features/authentication/auth_repository/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AuthenticationState()) {
    on<AuthenticationGoogleStatusChanged>(_login);
    on<AuthenticationLogoutRequested>(_logout);
  }
  final AuthRepository _authRepository;
  void _login(AuthenticationGoogleStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.logging));
      final authResponse = await _authRepository.signInWithGoogle();
      emit(state.copyWith(authStatus: AuthStatus.loggedIn));
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }

  void _logout(AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.logging));
      // final authResponse = await authRepository.signInWithGoogle();
      emit(state.copyWith(authStatus: AuthStatus.loggedOut));
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }
}
