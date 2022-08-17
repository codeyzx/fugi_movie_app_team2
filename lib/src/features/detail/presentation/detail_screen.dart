import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/common_config/palette.dart';
import 'package:fugi_movie_app_team2/src/features/detail/presentation/widgets/about_movie.dart';
import 'package:fugi_movie_app_team2/src/features/detail/presentation/widgets/cast.dart';
import 'package:fugi_movie_app_team2/src/features/detail/presentation/widgets/reviews.dart';

import './widgets/movie_status.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/bg_detail.png',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppTheme.secondaryColor,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.orange[500],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '9.5',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange[500],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 180, 30, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/movie2.png',
                          width: 80,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Spiderman No Way Home',
                            style: TextStyle(fontSize: 30),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieStatus(
                              icon: Icons.date_range,
                              text: '2021',
                            ),
                            MovieStatus(
                              icon: Icons.watch_later_outlined,
                              text: '148 Minutes',
                            ),
                            MovieStatus(
                              icon: Icons.airplane_ticket,
                              text: 'Action',
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 360,
                      child: DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            TabBar(
                                indicatorColor: Palette.team2color[400],
                                labelPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: [
                                  Text('About Movie'),
                                  Text('Reviews'),
                                  Text('Cast'),
                                ]),
                            Expanded(
                              child: TabBarView(children: [
                                AboutMovie(),
                                Reviews(),
                                Cast(),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
