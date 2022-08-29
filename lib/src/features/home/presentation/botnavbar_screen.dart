import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/home_screen.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_watchlist_controller.dart';
import 'package:fugi_movie_app_team2/src/features/profile/presentation/profile_screen.dart';
import 'package:fugi_movie_app_team2/src/features/search/presentation/search_screen.dart';

import '../../movie_detail/presentation/movie_watchlist.dart';

class BotNavBarScreen extends StatefulWidget {
  const BotNavBarScreen({Key? key}) : super(key: key);
  static const routeName = '/botnavbar-screen';

  @override
  State<BotNavBarScreen> createState() => BotNavBarScreenState();
}

class BotNavBarScreenState extends State<BotNavBarScreen> {
  int currentIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 1.5.sp),
          decoration: const BoxDecoration(
            color: AppTheme.textBlueColor,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 25.0.sp,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                switch (currentIndex) {
                  case 0:
                    currentScreen = const HomeScreen();
                    break;
                  case 1:
                    currentScreen = const SearchScreen();
                    break;
                  case 2:
                    currentScreen = const WatchlistScreen();
                    break;
                  case 3:
                    currentScreen = const ProfileScreen();
                    break;
                  default:
                }
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(FontAwesomeIcons.houseChimney),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(FontAwesomeIcons.magnifyingGlass),
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(FontAwesomeIcons.bookmark),
                  ),
                  label: 'Watch List'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(FontAwesomeIcons.user),
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
