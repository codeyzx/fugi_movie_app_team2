import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/widgets/image_number_widget.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../common_config/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: KeyboardDismisser(
        gestures: const [
          GestureType.onTap,
          GestureType.onVerticalDragDown,
          GestureType.onVerticalDragEnd,
        ],
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('What do you want to watch?'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                    flex: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppTheme.secondaryColor,
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: AppTheme.textBlueColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: AppTheme.thirdColor,
                            size: 32,
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: AppTheme.thirdColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: AppTheme.textBlueColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ImageNumberWidget(
                          number: (index + 1),
                        );
                      },
                    )),
                Expanded(
                  flex: 2,
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: 4,
                    child: SafeArea(
                      child: Scaffold(
                        appBar: const TabBar(
                          isScrollable: true,
                          tabs: [
                            Tab(text: 'Now Playing'),
                            Tab(text: 'Upcoming'),
                            Tab(text: 'Top Rated'),
                            Tab(text: 'Popular'),
                          ],
                        ),
                        body: TabBarView(
                          children: [
                            Center(
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  mainAxisExtent: MediaQuery.of(context).size.width * 0.5,
                                ),
                                padding: const EdgeInsets.all(5),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => context.pushNamed(
                                      MovieDetailScreen.routeName,
                                      // ProfileScreen.routeName,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/movie${index + 1}.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Center(child: Text('Tab 2')),
                            const Center(child: Text('Tab 3')),
                            const Center(child: Text('Tab 4')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
