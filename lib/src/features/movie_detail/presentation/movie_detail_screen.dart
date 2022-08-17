import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'movie-detail-screen';

  @override
  Widget build(BuildContext context) {
    final defaultPadding = const EdgeInsets.symmetric(horizontal: 7);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(),
            Text('Detail'),
            Icon(Icons.hub),
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
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        width: 75,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              ),
                              const Text(
                                '9.5',
                                style: const TextStyle(
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
                            borderRadius: const BorderRadius.all(const Radius.circular(10)),
                          ),
                          const SizedBox(width: 20),
                          const Flexible(
                            child: Text(
                              'Spiderman No Way Home',
                              style: const TextStyle(
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
                      const Icon(Icons.calendar_month, color: AppTheme.fourthColor),
                      const Text('2022', style: TextStyle(color: AppTheme.fourthColor, fontSize: 18)),
                      const Divider(
                        color: AppTheme.fourthColor,
                        thickness: 1,
                      ),
                      const Icon(Icons.watch_later, color: AppTheme.fourthColor),
                      const Text(' 180 Minuts', style: TextStyle(color: AppTheme.fourthColor, fontSize: 18)),
                      const Icon(Icons.airplane_ticket, color: AppTheme.fourthColor),
                      const Text('Action', style: TextStyle(color: AppTheme.fourthColor, fontSize: 18)),
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
                  appBar: const TabBar(
                    tabs: [
                      Tab(child: const Text('About Movie')),
                      const Tab(child: Text('Reviews')),
                      Tab(child: Text('Cast')),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                          child: ListView.builder(
                        padding: const EdgeInsets.all(15),
                        itemBuilder: (context, index) {
                          return const Card(
                            color: AppTheme.thirdColor,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppTheme.secondaryColor,
                              ),
                            ),
                          );
                        },
                      )),
                      Container(child: const Text('Reviews')),
                      Container(child: const Text('Cast')),
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
