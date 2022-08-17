import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'movie-detail-screen';

  @override
  Widget build(BuildContext context) {
    final defaultPadding = EdgeInsets.symmetric(horizontal: 7);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('Detail'),
            Icon(
              Icons.hub,
            )
          ],
        ),
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
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(15),
                        width: 75,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              ),
                              Text(
                                '9.5',
                                style: TextStyle(
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
                  top: 215,
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
                            child: Image.asset(
                              'assets/images/movie-sub-hero.png',
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          SizedBox(width: 20),
                          Flexible(
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
                      Icon(Icons.calendar_month, color: AppTheme.fourthColor),
                      Text('2022', style: const TextStyle(color: AppTheme.fourthColor, fontSize: 18)),
                      Divider(
                        color: AppTheme.fourthColor,
                        thickness: 1,
                      ),
                      Icon(Icons.watch_later, color: AppTheme.fourthColor),
                      Text(' 180 Minuts', style: const TextStyle(color: AppTheme.fourthColor, fontSize: 18)),
                      Icon(Icons.airplane_ticket, color: AppTheme.fourthColor),
                      Text('Action', style: const TextStyle(color: AppTheme.fourthColor, fontSize: 18)),
                    ],
                  ),
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
                  appBar: TabBar(
                    tabs: [
                      Tab(child: Text('About Movie')),
                      Tab(child: Text('Reviews')),
                      Tab(child: Text('Cast')),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                          child: ListView.builder(
                        padding: EdgeInsets.all(15),
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppTheme.thirdColor,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppTheme.secondaryColor,
                              ),
                            ),
                          );
                        },
                      )),
                      Container(child: Text('Reviews')),
                      Container(child: Text('Cast')),
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
