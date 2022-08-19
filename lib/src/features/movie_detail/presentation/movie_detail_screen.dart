import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'movie-detail-screen';
  double SliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
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
                      child: GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
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
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      padding: EdgeInsets.all(20),
                                      child: WidgetSLider(),
                                    )
                                  ],
                                );
                              }));
                        },
                        // child: Container(
                        //   padding: const EdgeInsets.all(10),
                        //   margin: const EdgeInsets.all(15),
                        //   width: 75,
                        //   decoration: BoxDecoration(
                        //     color: AppTheme.primaryColor,
                        //     borderRadius: BorderRadius.circular(50),
                        //     border: Border.all(color: Colors.orange),
                        //   ),
                        //   child: Center(
                        //     child: Row(
                        //       children: [
                        //         const Icon(
                        //           Icons.star_border,
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
                              children: const [
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

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.calendar_month,
                          color: AppTheme.fourthColor),
                      const Text('2022',
                          style: TextStyle(
                              color: AppTheme.fourthColor, fontSize: 18)),
                      const Divider(
                        color: AppTheme.fourthColor,
                        thickness: 1,
                      ),
                      const Icon(Icons.watch_later,
                          color: AppTheme.fourthColor),
                      const Text(' 180 Minuts',
                          style: TextStyle(
                              color: AppTheme.fourthColor, fontSize: 18)),
                      const Icon(Icons.airplane_ticket,
                          color: AppTheme.fourthColor),
                      const Text('Action',
                          style: TextStyle(
                              color: AppTheme.fourthColor, fontSize: 18)),
                      Icon(Icons.calendar_month, color: AppTheme.fourthColor),
                      Text('2022',
                          style: TextStyle(
                              color: AppTheme.fourthColor, fontSize: 18)),
                      Divider(
                        color: AppTheme.fourthColor,
                        thickness: 1,
                      ),
                      Icon(Icons.watch_later, color: AppTheme.fourthColor),
                      Text(' 180 Minuts',
                          style: TextStyle(
                              color: AppTheme.fourthColor, fontSize: 18)),
                      Icon(Icons.airplane_ticket, color: AppTheme.fourthColor),
                      Text('Action',
                          style: TextStyle(
                              color: AppTheme.fourthColor, fontSize: 18)),
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
                      Tab(child: Text('About Movie')),
                      Tab(child: Text('Reviews')),
                      Tab(child: Text('Cast')),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      ListView.builder(
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
                      ),
                      const Text('Reviews'),
                      const Text('Cast'),
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
            style: GoogleFonts.montserrat().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppTheme.thirdColor)),
        SizedBox(height: 20),
        Text('${double.parse(SliderValue.toStringAsFixed(1))}',
            style: GoogleFonts.montserrat().copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: AppTheme.thirdColor)),
        SizedBox(height: 10),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: Color(0XFFFF8700),
            trackHeight: 10,
            overlayColor: Colors.amber,
            inactiveTrackColor: Colors.grey,
            thumbColor: Colors.white,
            thumbShape:
                RoundSliderThumbShape(elevation: 10, enabledThumbRadius: 15),
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
        SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            width: 220,
            height: 56,
            color: Color(0XFF0296E5),
            child: Center(
              child: Text("OK",
                  style: GoogleFonts.montserrat().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}
