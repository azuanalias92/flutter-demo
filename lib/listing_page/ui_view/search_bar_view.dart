import 'package:flutter/material.dart';

import '../../app_theme.dart';

class SearchBarView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const SearchBarView({Key? key, this.animationController, this.animation})
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      SearchBar(
                          trailing: [const Icon(Icons.search)],
                          padding: MaterialStateProperty.all(
                              EdgeInsets.only(left: 16, right: 24)),
                          elevation: MaterialStateProperty.all(20),
                          hintText: 'Cari Perolehan',
                          hintStyle: MaterialStateProperty.all(
                            const TextStyle(color: AppTheme.grey),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(padding: EdgeInsets.all(20)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
