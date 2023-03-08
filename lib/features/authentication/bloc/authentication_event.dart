part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationGoogleStatusChanged extends AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class FetchUserProfileEvent extends AuthenticationEvent {}

class CheckLoginEvent extends AuthenticationEvent {}
