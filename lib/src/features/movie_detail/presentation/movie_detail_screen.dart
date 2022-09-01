import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/core/client/dio_client.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/movie_detail.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/trending.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/home_controller.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_watchlist_controller.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/about_movie.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/cast.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/cast_card.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/movie_status.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/reviews.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../home/presentation/botnavbar_screen.dart';
import '../../search/presentation/search_page.dart';
import '../../search/presentation/widgets/movie_item_widget.dart';

class MovieDetailScreen extends StatefulHookConsumerWidget {
  final Map<String, dynamic>? idAndObject;
  final Trending? trending;
  final String? paramRouteName;
  const MovieDetailScreen({
    Key? key,
    this.trending,
    this.idAndObject,
    this.paramRouteName,
  }) : super(key: key);
  static const routeName = 'movie-detail-screen';

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  MovieDetail detailMovie = const MovieDetail();
  bool isLoading = false;
  bool isError = false;
  final List<PaletteColor> _colors = [];
  List responseListCast = [];
  final int _currentIndex = 0;
  dynamic nextMovieId = 0;
  dynamic prevMovieId = 0;
  var swaipCardController = const SwiperControl();
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchDataCast();
  }

  void _updatePalettes(MovieDetail movieDetailResponse) async {
    var poster = movieDetailResponse.posterPath;
    final generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(
        'https://image.tmdb.org/t/p/w500/$poster',
      ),
    );
    _colors.add(
      // generator.lightVibrantColor ?? generator.lightVibrantColor ?? PaletteColor(Colors.teal, 2),
      generator.darkVibrantColor ?? generator.lightVibrantColor ?? PaletteColor(Colors.teal, 2),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final movieIdsState = ref.read(homeController).where(
          (element) => element!['category'] == widget.idAndObject!['type'],
        );

    TabBar myTabBar = TabBar(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.sp),
        color: _colors.isNotEmpty ? _colors[_currentIndex].color.withOpacity(.3) : Colors.black.withOpacity(0.5),
      ),
      tabs: const [
        Tab(child: Text('Reviews')),
        Tab(child: Text('About Movie')),
        Tab(child: Text('Production')),
        Tab(child: Text('Cast')),
      ],
      indicatorColor: AppTheme.textColor,
      unselectedLabelColor: Colors.white,
      unselectedLabelStyle: TextStyle(fontSize: 11.0.sp),
      labelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 10.0.sp),
    );

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail ${widget.idAndObject!['type']}'),
          // leading: IconButton(
          //   icon: const Icon(FontAwesomeIcons.house),
          //   onPressed: () {
          //     doRedirect();
          //   },
          // ),
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              context.goNamed(ref.watch(movieDetailAccessFromProvider));
              // doRedirect();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(watchlistControllerProvider.notifier).addToWatchlist(detailMovie);
                ref.read(homeController.notifier).add('watchlist', detailMovie.id);
                setState(() {});
              },
              icon: getStatusWitch(detailMovie),
            ),
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : widget.idAndObject!['type'] != 'watchlist'
                ? Swiper(
                    itemCount: getCountIndex(),
                    loop: true,
                    autoplay: false,
                    onIndexChanged: (value) {
                      // Logger().v('__findIndex: $_findIndex');
                      // Logger().v('__value_swipe_index: $value');
                      // Logger().v('__value_swipe_length: ${movieIdsState.length}');
                      // Logger().v('prevMovieId: $prevMovieId');
                      if (value == 1) {
                        context.pushNamed(
                          MovieDetailScreen.routeName,
                          extra: {
                            "id": nextMovieId,
                            "object": '',
                            "type": widget.idAndObject!['type'],
                          },
                        );
                      } else {
                        context.pushNamed(
                          MovieDetailScreen.routeName,
                          extra: {
                            "id": prevMovieId,
                            "object": '',
                            "type": widget.idAndObject!['type'],
                          },
                        );
                      }
                    },
                    // control: const SwiperControl(),
                    scale: .9,
                    curve: Curves.easeInOut,
                    itemBuilder: (context, index) {
                      if (isError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200.0.w,
                              child: Text(
                                'Sorry 🙏, The resource you requested could not be found. Movie with ID ${widget.idAndObject?['id']} not found',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppTheme.textBlueColor,
                              ),
                              onPressed: () {},
                              child: const Text('Swipe to Home'),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).size.height * .09.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20.0.sp),
                                            bottomRight: Radius.circular(20.0.sp),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: _colors.isNotEmpty
                                                  ? _colors[_currentIndex].color.withOpacity(.3)
                                                  : Colors.black.withOpacity(0.5),
                                              spreadRadius: 5.5.sp,
                                              blurRadius: 5.0.sp,
                                              offset: const Offset(0, 2), // changes position of shadow
                                            ),
                                          ],
                                          color: AppTheme.secondaryColor,
                                          // image: DecorationImage(
                                          //   image: detailMovie.backdropPath != null
                                          //       ? NetworkImage('https://image.tmdb.org/t/p/w780/${detailMovie.backdropPath}')
                                          //       : Image.asset('assets/icons/no-image.png').image,
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20.0.sp),
                                            bottomRight: Radius.circular(20.0.sp),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: "https://image.tmdb.org/t/p/w780/${detailMovie.backdropPath}",
                                            height: MediaQuery.of(context).size.height * .5.sp,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      // Text('${widget.trending.id}'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Movie ID: ${widget.idAndObject!['id']}',
                                              style: TextStyle(
                                                fontSize: 10.0.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            // Flexible(child: Text('${movieIdsState.toString()}')),
                                            // Flexible(child: Text('${getCountIndex()}')),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 100.0.sp,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                backgroundColor: Colors.transparent,
                                                builder: ((BuildContext context) {
                                                  return Wrap(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(20.0.sp),
                                                            topRight: Radius.circular(20.0.sp),
                                                          ),
                                                        ),
                                                        padding: EdgeInsets.all(20.0.sp),
                                                        child: const WidgetSLider(),
                                                      )
                                                    ],
                                                  );
                                                }));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 15.0.sp, horizontal: 15.0.sp),
                                            width: 70.0.sp,
                                            height: 35.0.sp,
                                            decoration: BoxDecoration(
                                              color: AppTheme.primaryColor,
                                              borderRadius: BorderRadius.circular(10.0.sp),
                                              border: Border.all(color: Colors.orange),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  const Icon(Icons.star_border, color: Colors.orange),
                                                  Text('${detailMovie.voteAverage?.toStringAsFixed(1)}',
                                                      style: TextStyle(
                                                        fontSize: 14.0.sp,
                                                        color: Colors.orange,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: 0.0.sp,
                                    right: 0.0.sp,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 25.0.sp,
                                          // vertical: 5.0.sp,
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 75.0.sp,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0.sp),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: _colors.isNotEmpty
                                                        ? _colors[_currentIndex].color.withOpacity(.5)
                                                        : Colors.white,
                                                    blurRadius: 10.0.sp,
                                                    spreadRadius: 5.0.sp,
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
                                                child: detailMovie.posterPath != null
                                                    ? Image.network(
                                                        'https://image.tmdb.org/t/p/w500/${detailMovie.posterPath}',
                                                        fit: BoxFit.cover,
                                                        width: 90.sp,
                                                      )
                                                    : Image.asset(
                                                        'assets/icons/no-image.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Flexible(
                                              child: Column(
                                                children: [
                                                  SizedBox(height: Platform.isIOS ? 30.0.sp : 50.0.sp),
                                                  Text(
                                                    '${detailMovie.title}',
                                                    style: TextStyle(
                                                      fontSize: 22.0.sp,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0.sp),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.6.sp,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      MovieStatus(
                                        icon: FontAwesomeIcons.calendarWeek,
                                        text: detailMovie.releaseDate != ''
                                            ? DateFormat('dd MMM yyyy')
                                                .format(DateTime.parse(detailMovie.releaseDate.toString()))
                                                .toString()
                                            : '-',
                                      ),
                                      MovieStatus(icon: FontAwesomeIcons.clock, text: '${detailMovie.runtime} min'),
                                      MovieStatus(
                                          icon: FontAwesomeIcons.ticket,
                                          text: detailMovie.genres!.isNotEmpty ? '${detailMovie.genres?[0].name}' : '-'),
                                      // MovieStatus(
                                      //     icon: FontAwesomeIcons.ticket,
                                      //     text: detailMovie.genres!.isNotEmpty ? '${detailMovie.genres?[0].name}' : '-'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0.sp),
                            Expanded(
                              flex: 2,
                              child: DefaultTabController(
                                length: 4,
                                child: Scaffold(
                                  appBar: myTabBar,
                                  body: TabBarView(
                                    children: [
                                      AboutMovie(
                                        movieTitle: detailMovie.title,
                                        content: detailMovie.overview ?? '-',
                                      ),
                                      Reviews(content: detailMovie.overview ?? '-'),
                                      Cast(content: detailMovie.productionCompanies!),
                                      CastCard(listData: responseListCast),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    })
                : Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height * .09.sp,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0.sp),
                                      bottomRight: Radius.circular(15.0.sp),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: _colors.isNotEmpty
                                            ? _colors[_currentIndex].color.withOpacity(.3)
                                            : Colors.black.withOpacity(0.5),
                                        spreadRadius: 5.5.sp,
                                        blurRadius: 5.0.sp,
                                        offset: const Offset(0, 2), // changes position of shadow
                                      ),
                                    ],
                                    color: AppTheme.secondaryColor,
                                    // image: DecorationImage(
                                    //   image: detailMovie.backdropPath != null
                                    //       ? NetworkImage('https://image.tmdb.org/t/p/w780/${detailMovie.backdropPath}')
                                    //       : Image.asset('assets/icons/no-image.png').image,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  child: Center(
                                    child: CachedNetworkImage(
                                      imageUrl: "https://image.tmdb.org/t/p/w780/${detailMovie.backdropPath}",
                                      height: MediaQuery.of(context).size.height * .5.sp,
                                      fit: BoxFit.fitHeight,
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                // Text('${widget.trending.id}'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Movie ID: ${widget.idAndObject!['id']}',
                                        style: TextStyle(
                                          fontSize: 10.0.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      // Flexible(child: Text('${movieIdsState.toString()}')),
                                      // Flexible(child: Text('${getCountIndex()}')),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 100.0.sp,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: ((BuildContext context) {
                                            return Wrap(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20.0.sp),
                                                      topRight: Radius.circular(20.0.sp),
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.all(20.0.sp),
                                                  child: const WidgetSLider(),
                                                )
                                              ],
                                            );
                                          }));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 15.0.sp, horizontal: 15.0.sp),
                                      width: 70.0.sp,
                                      height: 35.0.sp,
                                      decoration: BoxDecoration(
                                        color: AppTheme.primaryColor,
                                        borderRadius: BorderRadius.circular(10.0.sp),
                                        border: Border.all(color: Colors.orange),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(Icons.star_border, color: Colors.orange),
                                            Text('${detailMovie.voteAverage?.toStringAsFixed(1)}',
                                                style: TextStyle(
                                                  fontSize: 14.0.sp,
                                                  color: Colors.orange,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 0.0.sp,
                              right: 0.0.sp,
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.0.sp,
                                    // vertical: 5.0.sp,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 75.0.sp,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0.sp),
                                          boxShadow: [
                                            BoxShadow(
                                              color: _colors.isNotEmpty
                                                  ? _colors[_currentIndex].color.withOpacity(.5)
                                                  : Colors.white,
                                              blurRadius: 10.0.sp,
                                              spreadRadius: 5.0.sp,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
                                          child: detailMovie.posterPath != null
                                              ? Image.network(
                                                  'https://image.tmdb.org/t/p/w500/${detailMovie.posterPath}',
                                                  fit: BoxFit.cover,
                                                  width: 90.sp,
                                                )
                                              : Image.asset(
                                                  'assets/icons/no-image.png',
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            SizedBox(height: Platform.isIOS ? 30.0.sp : 50.0.sp),
                                            Text(
                                              '${detailMovie.title}',
                                              style: TextStyle(
                                                fontSize: 22.0.sp,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0.sp),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6.sp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MovieStatus(
                                  icon: FontAwesomeIcons.calendarWeek,
                                  text: detailMovie.releaseDate != ''
                                      ? DateFormat('dd MMM yyyy')
                                          .format(DateTime.parse(detailMovie.releaseDate.toString()))
                                          .toString()
                                      : '-',
                                ),
                                MovieStatus(icon: FontAwesomeIcons.clock, text: '${detailMovie.runtime} min'),
                                MovieStatus(
                                    icon: FontAwesomeIcons.ticket,
                                    text: detailMovie.genres!.isNotEmpty ? '${detailMovie.genres?[0].name}' : '-'),
                                // MovieStatus(
                                //     icon: FontAwesomeIcons.ticket,
                                //     text: detailMovie.genres!.isNotEmpty ? '${detailMovie.genres?[0].name}' : '-'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0.sp),
                      Expanded(
                        flex: 2,
                        child: DefaultTabController(
                          length: 4,
                          child: Scaffold(
                            appBar: myTabBar,
                            body: TabBarView(
                              children: [
                                AboutMovie(
                                  movieTitle: detailMovie.title,
                                  content: detailMovie.overview ?? '-',
                                ),
                                Reviews(content: detailMovie.overview ?? '-'),
                                Cast(content: detailMovie.productionCompanies!),
                                CastCard(listData: responseListCast),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  void fetchDataCast() async {
    try {
      setState(() {
        isLoading = true;
      });

      var resp = await DioClient().apiCall(
        url: '/movie/${widget.idAndObject!['id']}/credits',
        requestType: RequestType.get,
        queryParameters: {},
      );

      var respBody = resp.data;

      setState(() {
        responseListCast = respBody['cast'];
        isLoading = false;
      });
    } on DioError catch (e) {
      // Logger().e(e.response?.data);
      setState(() {
        isError = true;
        isLoading = false;
      });
      if (e.response?.statusCode == 404) {
        doRedirect();
      }
    } catch (e) {
      // Logger().e(e);
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  void fetchData() async {
    try {
      if (widget.idAndObject!['type'] != 'watchlist') {
        //Block pengecekan Movie Id selanjutnya, untuk kebutuhan Swipe
        final listOfIds = ref.read(homeController).where((element) => element!['category'] == widget.idAndObject!['type']);
        var myData = [...listOfIds];

        var findIndex = myData.indexWhere(
          (element) {
            return element!['value'] == widget.idAndObject!['id'] && element['category'] == widget.idAndObject!['type'];
          },
        );
        Map? nextMovieIndex = {};
        Map? prevMovieIndex = {};
        if (findIndex != -1 && myData.length > (findIndex + 1)) {
          //jika index yg ditemukan ada (tidak -1) dan jika jumlah data masih lebih dari index yang ditemukan, maka ambil data berikutnya.
          nextMovieIndex = myData[findIndex + 1];
          if (findIndex != 0) {
            Logger().i('prevMovieIndex true: $findIndex');
            prevMovieIndex = myData[findIndex - 1];
          } else {
            Logger().i('prevMovieIndex false: $findIndex');
            prevMovieIndex = myData[findIndex];
          }
          Logger().i('true $nextMovieIndex, $prevMovieIndex');
        } else {
          //jika tidak ada data berikutnya, maka ambil data pertama ke-0.
          nextMovieIndex = myData[findIndex];
          prevMovieIndex = myData[findIndex - 1];

          Logger().i('false $nextMovieIndex, $prevMovieIndex');
        }
        //Block pengecekan Movie Id selanjutnya, untuk kebutuhan Swipe
        setState(() {
          nextMovieId = nextMovieIndex?['value'];
          prevMovieId = prevMovieIndex?['value'];
          isLoading = true;
        });
      }
      var resp = await DioClient().apiCall(
        // url: '/movie/${widget.trending.id}',
        url: '/movie/${widget.idAndObject?['id']}',
        requestType: RequestType.get,
        queryParameters: {},
      );
      var respBody = resp.data;
      MovieDetail movieDetailResponse = MovieDetail.fromJson(respBody);
      setState(() {
        detailMovie = movieDetailResponse;
        isLoading = false;
      });
      _updatePalettes(movieDetailResponse);
    } on DioError catch (e) {
      // Logger().e(e.response?.data);
      setState(() {
        isError = true;
        isLoading = false;
      });
      if (e.response?.statusCode == 404) {
        doRedirect();
      }
    } catch (e) {
      // Logger().e(e);
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  Widget getStatusWitch(MovieDetail detailMovie) {
    var status = ref.read(watchlistControllerProvider.notifier).isWishlist(detailMovie);
    return status
        ? Icon(
            Icons.bookmark_added,
            color: Colors.orange,
            size: 24.0.sp,
          )
        : Icon(
            Icons.bookmark_border,
            color: Colors.orange,
            size: 24.0.sp,
          );
  }

  int getCountIndex() {
    var listOfIds = ref.watch(homeController);
    var listOfIdsLength = listOfIds
        .where(
          (element) => element!['category'] == widget.idAndObject!['type'],
        )
        .toList();
    return listOfIdsLength.length;
  }

  void doRedirect() {
    if (widget.idAndObject!['type'] == 'search') {
      // context.goNamed(SearchScreen.routeName);
      context.pushNamed(SearchPage.routeName);
    } else {
      context.goNamed(BotNavBarScreen.routeName);
    }
  }
}

class WidgetSLider extends StatefulWidget {
  const WidgetSLider({Key? key}) : super(key: key);

  @override
  State<WidgetSLider> createState() => _WidgetSLiderState();
}

class _WidgetSLiderState extends State<WidgetSLider> {
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Rate this Movie",
            style: GoogleFonts.montserrat().copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.thirdColor)),
        const SizedBox(height: 20),
        Text('${double.parse(sliderValue.toStringAsFixed(1))}',
            style: GoogleFonts.montserrat().copyWith(fontSize: 32, fontWeight: FontWeight.w400, color: AppTheme.thirdColor)),
        const SizedBox(height: 10),
        SliderTheme(
          data: const SliderThemeData(
            activeTrackColor: Color(0XFFFF8700),
            trackHeight: 10,
            overlayColor: Colors.amber,
            inactiveTrackColor: Colors.grey,
            thumbColor: Colors.white,
            thumbShape: RoundSliderThumbShape(elevation: 10, enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
          ),
          // thumbColor: Colors.green,
          // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),
          child: Slider(
            value: sliderValue,
            max: 10,
            // divisions: 100,
            label: '${sliderValue.round()}',
            // thumbColor: Colors.white,
            // activeColor: Colors.amber,
            autofocus: true,
            //inactiveColor: Colors.grey,
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            width: 220,
            height: 56,
            color: const Color(0XFF0296E5),
            child: Center(
              child: Text("OK",
                  style: GoogleFonts.montserrat().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}
