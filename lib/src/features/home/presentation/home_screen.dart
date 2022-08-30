import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/popular.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/top_rated.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/upcoming.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/widgets/image_number_widget.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_detail_screen.dart';
import 'package:fugi_movie_app_team2/src/features/search/presentation/search_controller.dart';
import 'package:fugi_movie_app_team2/src/features/search/presentation/search_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../common_config/app_theme.dart';
import '../../../core/client/dio_client.dart';
import '../domain/trending.dart';

final keywordsProvider = StateProvider<String?>((ref) => '');

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home-screen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var selectedIndex = 0;
  bool isLoading = false;
  List<Trending> trendings = [];
  List<Popular> populars = [];
  List<TopRated> toprateds = [];
  List<Upcoming> upcomings = [];
  bool isLoadingSearch = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var searchController = useTextEditingController();

    ref.listen<AsyncValue<List<Map<String, dynamic>>?>>(
      searchControllerProvider,
      (prev, state) {
        if (!state.isRefreshing && !state.hasError) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            context.pushNamed(SearchScreen.routeName);
            setState(() {
              isLoadingSearch = false;
            });
          });
        }
        if (state.isRefreshing) {
          setState(() {
            isLoadingSearch = true;
          });
        }
      },
    );

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
                        borderRadius: BorderRadius.circular(50.0.sp),
                        color: AppTheme.secondaryColor,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          ref.read(keywordsProvider.state).state = value;
                          setState(() {});
                        },
                        onSubmitted: (value) {
                          ref.read(searchControllerProvider.notifier).search(
                                searchController.text.toLowerCase(),
                              );
                        },
                        controller: searchController,
                        style: const TextStyle(color: AppTheme.textBlueColor),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15.0.sp),
                          suffixIcon: InkWell(
                            onTap: () => {
                              ref.read(searchControllerProvider.notifier).search(
                                    searchController.text.toLowerCase(),
                                  ),
                            },
                            child: isLoadingSearch
                                ? const CircularProgressIndicator()
                                : searchController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          searchController.clear();
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: AppTheme.textBlueColor,
                                        ),
                                      )
                                    : Icon(
                                        Icons.search,
                                        color: AppTheme.thirdColor,
                                        size: 28.0.sp,
                                      ),
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: AppTheme.thirdColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0.sp),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0.sp),
                            borderSide: const BorderSide(
                              color: AppTheme.textBlueColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 16.5.sp),
                            scrollDirection: Axis.horizontal,
                            itemCount: populars.length,
                            itemBuilder: (context, index) {
                              return ImageNumberWidget<Popular>(
                                trending: populars[index],
                                number: (index + 1),
                              );
                            },
                          ),
                  ),
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
                                      childAspectRatio: .7,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                    ),
                                    padding: EdgeInsets.all(8.0.sp),
                                    itemCount: trendings.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          context.pushNamed(MovieDetailScreen.routeName, extra: {
                                            "id": trendings[index].id,
                                            "object": trendings[index],
                                          });
                                        },
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0.sp),
                                                image: DecorationImage(
                                                  image: Image.network(
                                                    'https://image.tmdb.org/t/p/w780/${trendings[index].posterPath}',
                                                  ).image,
                                                  fit: BoxFit.cover,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white.withOpacity(.2),
                                                    blurRadius: 10,
                                                    offset: const Offset(0, 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Text('${trendings[index].id}',
                                            //     style: TextStyle(color: Colors.white, fontSize: 20.0.sp)),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                GridView.builder(
                                  //upcoming
                                  scrollDirection: Axis.vertical,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: .6,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  padding: EdgeInsets.all(8.0.sp),
                                  itemCount: upcomings.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        // context.pushNamed(MovieDetailScreenUpcoming.routeName, extra: upcomings[index]);
                                        context.pushNamed(MovieDetailScreen.routeName, extra: {
                                          "id": upcomings[index].id,
                                          'object': upcomings[index],
                                        });
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
                                                  'https://image.tmdb.org/t/p/w780/${upcomings[index].posterPath}',
                                                ).image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // Text('${upcomings[index].id}',
                                          //     style: TextStyle(color: Colors.white, fontSize: 20.0.sp)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                GridView.builder(
                                  //top rated
                                  scrollDirection: Axis.vertical,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: .6,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  padding: EdgeInsets.all(8.0.sp),
                                  itemCount: toprateds.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        // context.pushNamed(MovieDetailScreenTopRated.routeName, extra: toprateds[index]);
                                        context.pushNamed(MovieDetailScreen.routeName, extra: {
                                          "id": toprateds[index].id,
                                          'object': toprateds[index],
                                        });
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
                                                  'https://image.tmdb.org/t/p/w780/${toprateds[index].posterPath}',
                                                ).image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // Text('${toprateds[index].id}',
                                          //     style: TextStyle(color: Colors.white, fontSize: 20.0.sp)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                GridView.builder(
                                  //popular
                                  scrollDirection: Axis.vertical,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: .6,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  padding: EdgeInsets.all(8.0.sp),
                                  itemCount: populars.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        // context.pushNamed(MovieDetailScreenPopular.routeName, extra: populars[index]);
                                        context.pushNamed(MovieDetailScreen.routeName, extra: {
                                          "id": populars[index].id,
                                          'object': populars[index],
                                        });
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context).size.height,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0.sp),
                                              image: DecorationImage(
                                                image: Image.network(
                                                  'https://image.tmdb.org/t/p/w780/${populars[index].posterPath}',
                                                ).image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // Text('${populars[index].id}',
                                          //     style: TextStyle(color: Colors.white, fontSize: 20.0.sp)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
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
    var resp = await DioClient().apiCall(
      url: '/trending/all/day',
      requestType: RequestType.get,
      queryParameters: {},
    );
    var respPopular = await DioClient().apiCall(
      url: '/movie/popular',
      requestType: RequestType.get,
      queryParameters: {},
    );
    var respTopRated = await DioClient().apiCall(
      url: '/movie/top_rated',
      requestType: RequestType.get,
      queryParameters: {},
    );
    var respUpcoming = await DioClient().apiCall(
      url: '/movie/upcoming',
      requestType: RequestType.get,
      queryParameters: {},
    );

    List<dynamic> listTrending = resp.data['results'];
    List<dynamic> listPopular = respPopular.data['results'];
    List<dynamic> listTopRated = respTopRated.data['results'];
    List<dynamic> listUpcoming = respUpcoming.data['results'];

    List<Popular> myPopular = listPopular.map((e) => Popular.fromJson(e)).toList();
    List<Trending> myTrendings = listTrending.map((e) => Trending.fromJson(e)).toList();
    List<TopRated> myTopRated = listTopRated.map((e) => TopRated.fromJson(e)).toList();
    List<Upcoming> myUpcoming = listUpcoming.map((e) => Upcoming.fromJson(e)).toList();

    if (mounted) {
      setState(() {
        isLoading = true;
        trendings = myTrendings;
        populars = myPopular;
        toprateds = myTopRated;
        upcomings = myUpcoming;
        isLoading = false;
      });
    }
  }
}
