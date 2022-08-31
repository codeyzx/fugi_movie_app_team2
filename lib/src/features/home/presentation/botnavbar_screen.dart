import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/home_screen.dart';
import 'package:fugi_movie_app_team2/src/features/profile/presentation/profile_screen.dart';
import 'package:fugi_movie_app_team2/src/features/search/presentation/search_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../movie_detail/presentation/movie_watchlist.dart';
import '../../movie_detail/presentation/movie_watchlist_controller.dart';

final currentScreenProvider = StateProvider<Widget>((ref) => const HomeScreen());
final currentIndexProvider = StateProvider<int>((ref) => 0);

class BotNavBarScreen extends StatefulHookConsumerWidget {
  const BotNavBarScreen({Key? key}) : super(key: key);
  static const routeName = '/botnavbar-screen';

  @override
  BotNavBarScreenState createState() => BotNavBarScreenState();
}

class BotNavBarScreenState extends ConsumerState<BotNavBarScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  // int currentIndex = 0;
  // Widget currentScreen = const HomeScreen();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentScreen = ref.watch(currentScreenProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    final watchlistState = ref.watch(watchlistControllerProvider);

    return SafeArea(
      top: false,
      bottom: false,
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
                // currentIndex = index;
                ref.read(currentIndexProvider.state).state = index;
                switch (index) {
                  case 0:
                    // currentScreen = const HomeScreen();
                    ref.read(currentScreenProvider.state).state = const HomeScreen();
                    break;
                  case 1:
                    // currentScreen = const SearchPage();
                    ref.read(currentScreenProvider.state).state = const SearchPage();
                    break;
                  case 2:
                    // currentScreen = const WatchlistScreen();
                    ref.read(currentScreenProvider.state).state = const WatchlistScreen();
                    break;
                  case 3:
                    // currentScreen = const ProfileScreen();
                    ref.read(currentScreenProvider.state).state = const ProfileScreen();
                    break;
                  default:
                }
              });
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(FontAwesomeIcons.houseChimney),
                  ),
                  label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(FontAwesomeIcons.magnifyingGlass),
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Icon(FontAwesomeIcons.bookmark),
                        if (watchlistState != null && watchlistState.isNotEmpty)
                          CircleAvatar(
                            radius: 5.5.sp,
                            backgroundColor: Colors.red,
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0.sp,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  label: 'Watch List'),
              const BottomNavigationBarItem(
                icon: Padding(padding: EdgeInsets.only(top: 8.0), child: Icon(FontAwesomeIcons.user)),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
