import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/features/authentication/auth_repository/auth_repository.dart';
import 'package:online_learning_app/features/authentication/models/user.dart';
import 'package:online_learning_app/features/homepage/bloc/catergory_bloc.dart';
import 'package:online_learning_app/features/homepage/models/userProfileModel.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthenticationBloc() : super(AuthenticationState()) {
    on<AuthenticationGoogleStatusChanged>(_login);
    on<AuthenticationFacebookStatusChanged>(_fblogin);
    on<FetchUserProfileEvent>(_fetchUserProfile);
    on<AuthenticationLogoutRequested>(_logout);
    on<CheckLoginEvent>(_checkLogin);
  }
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

  void _fblogin(AuthenticationFacebookStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.logging));
      final authResponse = await _authRepository.signInWithFacebook();

      emit(state.copyWith(authStatus: AuthStatus.loggedIn));
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }

  void _logout(AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.logging));
      await _authRepository.logOut();
      emit(state.copyWith(
          authStatus: AuthStatus.loggedOut,
          profileStatus: ProfileStatus.initial,
          userProfileModel: null));
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }

  void _checkLogin(CheckLoginEvent event, Emitter<AuthenticationState> emit) {
    try {
      // emit(state.copyWith(authStatus: AuthStatus.logging));
      final token = TokenService().getToken();
      if (token != null) {
        emit(state.copyWith(authStatus: AuthStatus.loggedIn));
      }
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.failure));
    }
  }

  void _fetchUserProfile(
      FetchUserProfileEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(profileStatus: ProfileStatus.loading));
      final userResponse = await _authRepository.fetchUserProfile();
      emit(state.copyWith(
          profileStatus: ProfileStatus.loaded, userProfileModel: userResponse));
    } catch (e) {
      emit(state.copyWith(profileStatus: ProfileStatus.failure));
    }
  }
}
