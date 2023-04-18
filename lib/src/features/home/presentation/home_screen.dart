import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../common_config/app_theme.dart';
import '../../../common_utils/ansyn_value_widget.dart';
import '../../../core/client/dio_client.dart';
import '../../search/presentation/search_controller.dart';
import '../../search/presentation/search_page.dart';
import '../domain/entities/popular.dart';
import '../domain/entities/top_rated.dart';
import '../domain/entities/trending.dart';
import '../domain/entities/upcoming.dart';
import 'home_botnavbar_screen.dart';
import 'home_controller.dart';
import 'widgets/grid_movie_widget.dart';
import 'widgets/image_number_widget.dart';

final keywordsProvider = StateProvider<String?>((ref) => '');
final apiToken = dotenv.env['API_KEY'];

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home-screen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var selectedIndex = 0;
  bool isLoading = false;
  // List<Trending> trendings = []; change to AsyncValue
  // List<Trending> upcoming = []; change to AsyncValue
  // List<Popular> populars = [];
  // List<TopRated> toprateds = [];
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
        // if (!state.isRefreshing && !state.hasError) {
        if (state is AsyncData) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            context.pushNamed(SearchPage.routeName);
            setState(() {
              isLoadingSearch = false;
            });
          });
        }

        if (state is AsyncLoading) {
          setState(() {
            isLoadingSearch = true;
          });
        }
      },
    );

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
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                //search part
                Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0.sp),
                      color: AppTheme.secondaryColor,
                    ),
                    child: TextField(
                      onTap: () {
                        ref.read(currentScreenProvider.notifier).state = const SearchPage();
                        ref.read(currentIndexProvider.notifier).state = 1;
                      },
                      onChanged: (value) {
                        ref.read(keywordsProvider.notifier).state = value;
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
                                  : Icon(Icons.search, color: AppTheme.thirdColor, size: 28.0.sp),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: AppTheme.thirdColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0.sp),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0.sp),
                          borderSide: const BorderSide(color: AppTheme.textBlueColor, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                //reatures
                Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator.adaptive())
                      : AsyncValueWidget<List<TopRated>?>(
                          value: ref.watch(topRatedControllerProvider),
                          data: (topRated) => ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 16.5.sp),
                            scrollDirection: Axis.horizontal,
                            itemCount: topRated?.length,
                            itemBuilder: (context, index) {
                              return ImageNumberWidget<TopRated>(
                                trending: topRated?[index] as TopRated,
                                number: (index + 1),
                                type: 'toprated',
                              );
                            },
                          ),
                        ),
                ),
                //footer
                Expanded(
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
                                AsyncValueWidget<List<Trending>?>(
                                  value: ref.watch(trendingControllerProvider),
                                  data: (trendings) {
                                    return GridMovieWidget<Trending>(listData: trendings);
                                  },
                                ),
                              if (isLoading)
                                const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              else
                                AsyncValueWidget<List<Upcoming>?>(
                                  value: ref.watch(upcomingControllerProvider),
                                  data: (upcomings) {
                                    return GridMovieWidget<Upcoming>(listData: upcomings);
                                  },
                                ),
                              if (isLoading)
                                const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              else
                                AsyncValueWidget<List<TopRated>?>(
                                  value: ref.watch(topRatedControllerProvider),
                                  data: (topRated) {
                                    return GridMovieWidget<TopRated>(listData: topRated);
                                  },
                                ),
                              if (isLoading)
                                const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              else
                                AsyncValueWidget<List<Popular>?>(
                                  value: ref.watch(popularControllerProvider),
                                  data: (populars) {
                                    return GridMovieWidget<Popular>(listData: populars);
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
    );
  }

  Future<void> fetchData() async {
    var respTrending = await DioClient().apiCall(
      url: '/trending/all/day',
      requestType: RequestType.get,
    );
    var respUpcoming = await DioClient().apiCall(
      url: '/movie/upcoming',
      requestType: RequestType.get,
    );
    var respTopRated = await DioClient().apiCall(
      url: '/movie/top_rated',
      requestType: RequestType.get,
    );
    var respPopular = await DioClient().apiCall(
      url: '/movie/popular',
      requestType: RequestType.get,
    );

    List<dynamic> listTrending = respTrending.data['results'];
    List<dynamic> listUpcoming = respUpcoming.data['results'];
    List<dynamic> listTopRated = respTopRated.data['results'];
    List<dynamic> listPopular = respPopular.data['results'];

    //Block untuk mengisi daftar id dari movie yang sudah di fetch, untuk fungsi swaip
    listTrending.map((e) {
      ref.read(homeController.notifier).add('trending', e['id']);
      return Popular.fromJson(e);
    }).toList();
    listUpcoming.map((e) {
      ref.read(homeController.notifier).add('upcoming', e['id']);
      return Popular.fromJson(e);
    }).toList();

    listTopRated.map((e) {
      ref.read(homeController.notifier).add('toprated', e['id']);
      return TopRated.fromJson(e);
    }).toList();

    listPopular.map((e) {
      ref.read(homeController.notifier).add('popular', e['id']);
      return Popular.fromJson(e);
    }).toList();
    //End of block
  }
}
