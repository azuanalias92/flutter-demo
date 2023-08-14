import 'package:flutter/material.dart';
import 'package:jomtender/profile_page/ui_view/profile_menu.dart';

import '../../app_theme.dart';

class UpdateProfileView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const UpdateProfileView({Key? key, this.animationController, this.animation})
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
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset("./assets/all.png")),
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
                                child: const Icon(Icons.edit,
                                    color: Colors.black, size: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                              child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('Nama Penuh'),
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('Emel'),
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('No Telefon'),
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  label: const Text('Kata Laluan'),
                                  prefixIcon: const Icon(Icons.fingerprint),
                                  suffixIcon: IconButton(
                                      icon: const Icon(Icons.visibility_off),
                                      onPressed: () {}),
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.white,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: const Text('Sunting Profil',
                                      style:
                                          TextStyle(color: AppTheme.darkGrey)),
                                ),
                              ),
                            ],
                          )),
                        )
                      ],
                    )),
              )),
        );
      },
    );
  }
}
