import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/about_movie.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/cast.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/movie_status.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/widgets/reviews.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'movie-detail-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * .175,
                      ),
                      child: Image.asset(
                        'assets/images/movie-hero.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 160,
                      right: 0,
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
                            children: const [
                              Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              ),
                              Text(
                                '9.5',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              'assets/images/movie-sub-hero.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Flexible(
                            child: Text(
                              'Spiderman No Way Home',
                              style: TextStyle(
                                fontSize: 28,
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieStatus(icon: Icons.calendar_month, text: '2022'),
                        MovieStatus(
                            icon: Icons.watch_later_outlined,
                            text: '148 Minutes'),
                        MovieStatus(
                            icon: Icons.airplane_ticket_rounded,
                            text: 'Action'),
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
                      Tab(child: Text('About Movie')),
                      Tab(child: Text('Reviews')),
                      Tab(child: Text('Cast')),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      AboutMovie(),
                      Reviews(),
                      Cast(),
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
}
