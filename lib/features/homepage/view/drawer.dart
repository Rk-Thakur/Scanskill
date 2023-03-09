import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/authentication/bloc/authentication_bloc.dart';
import 'package:online_learning_app/features/utils/route.dart';

import '../bloc/catergory_bloc.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = TokenService().getToken();
    return Drawer(
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.logging) {
            Center(
              child: CircularProgressIndicator(color: iconColor),
            );
          } else if (state.authStatus == AuthStatus.loggedOut) {
            Scaffold.of(context).closeEndDrawer();

            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          }
        },
        child: token != null
            ? ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if (state.profileStatus == ProfileStatus.loading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: iconColor,
                            ),
                          );
                        } else if (state.profileStatus ==
                            ProfileStatus.loaded) {
                          return UserAccountsDrawerHeader(
                              accountName: Text(
                                "${state.userProfileModel.data!.firstName!} " +
                                    "${state.userProfileModel.data!.lastName!}",
                                style: textStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              accountEmail: Text(
                                // userState.userModel.email.toString(),
                                state.userProfileModel.data!.email!,
                                style: textStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              currentAccountPictureSize: const Size.square(50),
                              currentAccountPicture: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/scanskill.jpeg'),
                              )
                              // currentAccountPicture: CachedNetworkImage(imageUrl: state.userProfileModel.data!.profileImage),//circleAvatar
                              );
                        } else {
                          return Container();
                        }
                      },
                    ), //UserAccountDrawerHeader
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(' My Profile '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text(' My Course '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.workspace_premium),
                    title: const Text(' Go Premium '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.video_label),
                    title: const Text(' Saved Videos '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text(' Edit Profile '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('LogOut'),
                    onTap: () {
                      print('logout');

                      context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested());
                    },
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Login for Dashboard"),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, loginScreen);
                    //     },
                    //     child: const Text("Login"))
                  ],
                ),
              ),
      ),
    );
  }
}
