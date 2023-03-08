// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

enum AuthStatus {
  initial,
  loggedIn,
  logging,
  loggedOut,
  failure,
}

enum ProfileStatus { initial, loading, loaded, failure }

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;
  final ProfileStatus profileStatus;
  final UserProfileModel userProfileModel;
  AuthenticationState(
      {this.authStatus = AuthStatus.initial,
      this.profileStatus = ProfileStatus.initial,
      this.userProfileModel = UserProfileModel.empty});

  AuthenticationState copyWith(
      {AuthStatus? authStatus,
      UserProfileModel? userProfileModel,
      ProfileStatus? profileStatus}) {
    return AuthenticationState(
      authStatus: authStatus ?? this.authStatus,
      profileStatus: profileStatus ?? this.profileStatus,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [authStatus, profileStatus, userProfileModel];
}
