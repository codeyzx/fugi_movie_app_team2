import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/widgets/image_number_widget.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../common_config/app_theme.dart';
import '../../../core/client/dio_client.dart';
import '../domain/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;
  bool isLoading = false;
  List<Trending> trendings = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await fetchData();
      },
      child: SafeArea(
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
                        padding: EdgeInsets.symmetric(vertical: 15.0.sp),
                        scrollDirection: Axis.horizontal,
                        itemCount: trendings.length,
                        itemBuilder: (context, index) {
                          return ImageNumberWidget(
                            trending: trendings[index],
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
                              Tab(text: 'Trending'),
                              Tab(text: 'Upcoming'),
                              Tab(text: 'Top Rated'),
                              Tab(text: 'Popular'),
                            ],
                          ),
                          body: RefreshIndicator(
                            onRefresh: () async {
                              fetchData();
                            },
                            child: TabBarView(
                              children: [
                                if (isLoading)
                                  const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                                else
                                  GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: .6,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                    padding: EdgeInsets.all(8.0.sp),
                                    itemCount: trendings.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          context.pushNamed(MovieDetailScreen.routeName, extra: trendings[index]);
                                        },
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: Image.network(
                                                    'https://image.tmdb.org/t/p/w780/${trendings[index].posterPath}',
                                                  ).image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text('${trendings[index].id}',
                                                style: TextStyle(color: Colors.white, fontSize: 20.0.sp)),
                                          ],
                                        ),
                                      );
                                    },
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    var resp = await DioClient().apiCall(
      url: '/trending/all/day',
      requestType: RequestType.get,
      queryParameters: {},
    );
    List<dynamic> listTrending = resp.data['results'];
    List<Trending> myTrendings = listTrending.map((e) => Trending.fromJson(e)).toList();
    setState(() {
      trendings = myTrendings;
      isLoading = false;
    });
  }
}
