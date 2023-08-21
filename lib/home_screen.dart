import 'package:jomtender/detail_page/detail_page_view.dart';
import 'package:jomtender/login_page/login_page_view.dart';
import 'package:jomtender/models/tab_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:jomtender/listing_page/search_page_view.dart';
import 'package:jomtender/profile_page/profile_page_view.dart';
import 'package:jomtender/profile_page/update_profile_page_view.dart';
import 'app_theme.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'main_page/main_page_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.white,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyMainPageScreen(animationController: animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getToken(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              if (snapshot.data == true) {
                return Stack(
                  children: <Widget>[
                    tabBody,
                    bottomBar(),
                  ],
                );
              } else {
                return LoginPageView(animationController: animationController);
              }
            }
          },
        ),
      ),
    );
  }

  Future<bool> getToken() async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');

    //print(token);

    if (token?.isEmpty ?? true) {
      return false;
    } else {
      return true;
    }
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            switch (index) {
              case 0:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = MyMainPageScreen(
                        animationController: animationController);
                  });
                });
                break;
              case 1:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = ListingPageScreen(
                        animationController: animationController);
                  });
                });
                break;
              case 2:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = DetailPageScreen(
                        animationController: animationController);
                  });
                });
                break;
              case 3:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = UpdateProfilePageView(
                        animationController: animationController);
                  });
                });
                break;
              default:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = ProfilePageView(
                        animationController: animationController);
                  });
                });
                break;
            }
          },
        ),
      ],
    );
  }
}
