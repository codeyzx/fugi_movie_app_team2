import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/core/client/dio_client.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/movie_detail.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/upcoming.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/about_movie.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/cast.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/movie_status.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/reviews.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class MovieDetailScreenUpcoming extends StatefulWidget {
  final String? idMovie;
  final Upcoming upcoming;
  const MovieDetailScreenUpcoming({Key? key, required this.upcoming, this.idMovie}) : super(key: key);
  static const routeName = 'movie-detail-screen-upcoming';

  @override
  State<MovieDetailScreenUpcoming> createState() => _MovieDetailScreenUpcomingState();
}

class _MovieDetailScreenUpcomingState extends State<MovieDetailScreenUpcoming> {
  MovieDetail detailMovie = const MovieDetail();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark))],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.335,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * .175,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                              color: AppTheme.secondaryColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/${detailMovie.backdropPath}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text('${widget.upcoming.id}'),
                          Positioned(
                            top: 160,
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
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                            padding: const EdgeInsets.all(20),
                                            child: const WidgetSLider(),
                                          )
                                        ],
                                      );
                                    }));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                width: 70,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                        size: 14.0.sp,
                                      ),
                                      Text(
                                        '${detailMovie.voteAverage}',
                                        style: TextStyle(
                                          fontSize: 14.0.sp,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 210,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${detailMovie.posterPath}',
                                    fit: BoxFit.cover,
                                    width: 90,
                                  ),
                                ),
                                const SizedBox(width: 25),
                                Flexible(
                                  child: Text(
                                    '(${detailMovie.title})',
                                    style: TextStyle(
                                      fontSize: 22.0.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          MovieStatus(
                              icon: FontAwesomeIcons.calendarWeek,
                              text: DateFormat('dd MMM yyyy').format(DateTime.parse(detailMovie.releaseDate.toString()))),
                          MovieStatus(icon: FontAwesomeIcons.clock, text: '${detailMovie.runtime} min'),
                          MovieStatus(icon: FontAwesomeIcons.ticket, text: '${detailMovie.genres?[0].name}'),
                        ]),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: DefaultTabController(
                    length: 3,
                    child: SafeArea(
                      top: false,
                      child: Scaffold(
                        appBar: const TabBar(
                          tabs: [
                            Tab(child: Text('Reviews')),
                            Tab(child: Text('About Movie')),
                            Tab(child: Text('Prod. Companies')),
                          ],
                        ),
                        body: TabBarView(
                          children: [
                            AboutMovie(content: detailMovie.overview ?? '-'),
                            Reviews(content: detailMovie.overview ?? '-'),
                            Cast(content: detailMovie.productionCompanies!),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void fetchData() async {
    try {
      setState(() {
        isLoading = true;
      });
      var resp = await DioClient().apiCall(
        url: '/movie/${widget.upcoming.id}',
        requestType: RequestType.get,
        queryParameters: {},
      );
      var respBody = resp.data;
      MovieDetail movieDetailResponse = MovieDetail.fromJson(respBody);
      setState(() {
        detailMovie = movieDetailResponse;
        isLoading = false;
      });
    } catch (e) {
      Logger().e(e);
    }
  }
}

class WidgetSLider extends StatefulWidget {
  const WidgetSLider({Key? key}) : super(key: key);

  @override
  State<WidgetSLider> createState() => _WidgetSLiderState();
}

class _WidgetSLiderState extends State<WidgetSLider> {
  double SliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Rate this Movie",
            style: GoogleFonts.montserrat().copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.thirdColor)),
        const SizedBox(height: 20),
        Text('${double.parse(SliderValue.toStringAsFixed(1))}',
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
            value: SliderValue,
            max: 10,
            // divisions: 100,
            label: '${SliderValue.round()}',
            // thumbColor: Colors.white,
            // activeColor: Colors.amber,
            autofocus: true,
            //inactiveColor: Colors.grey,
            onChanged: (double value) {
              setState(() {
                SliderValue = value;
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
