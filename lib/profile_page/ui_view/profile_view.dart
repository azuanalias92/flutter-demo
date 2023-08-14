import 'package:flutter/material.dart';
import 'package:jomtender/profile_page/ui_view/profile_menu.dart';

import '../../app_theme.dart';

class ProfileView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const ProfileView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation!.value), 0.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(children: [
                    // -- Image --- //
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRect(
                            child: Image.asset("./assets/all.png"),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppTheme.white),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Name',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('admin@email.com',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 20),

                    /// -- BUTTON
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.white,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('Sunting Profil',
                            style: TextStyle(color: AppTheme.darkGrey)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 10),

                    /// -- MENU
                    ProfileMenuWidget(
                        title: "Settings",
                        icon: Icons.settings,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Billing Details",
                        icon: Icons.wallet,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "User Management",
                        icon: Icons.person,
                        onPress: () {}),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: "Information", icon: Icons.info, onPress: () {}),
                    ProfileMenuWidget(
                        title: "Logout",
                        icon: Icons.logout,
                        textColor: AppTheme.nearlyDarkBlue,
                        endIcon: false,
                        onPress: () {}),
                  ]),
                ),
              )),
        );
      },
    );
  }
}
