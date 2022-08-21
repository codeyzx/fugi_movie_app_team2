import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/home_screen.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_watchlist.dart';
import 'package:fugi_movie_app_team2/src/features/profile/presentation/profile_screen.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          padding: const EdgeInsets.only(top: 1),
          decoration: const BoxDecoration(color: AppTheme.textBlueColor),
          child: BottomNavigationBar(
            iconSize: 32,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                switch (currentIndex) {
                  case 0:
                    currentScreen = const HomeScreen();
                    break;
                  case 1:
                    currentScreen = const WatchlistScreen();
                    break;
                  case 2:
                    currentScreen = const ProfileScreen();
                    break;
                  default:
                }
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//test push
//test push bima
