// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

enum AuthStatus {
  initial,
  loggedIn,
  logging,
  loggedOut,
  failure,
}

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;
  AuthenticationState({
    this.authStatus = AuthStatus.initial,
  });

  AuthenticationState copyWith({
    AuthStatus? authStatus,
  }) {
    return AuthenticationState(
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [authStatus];
}
