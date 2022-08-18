import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';


class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);
  static const routeName = '/watchlist-screen';

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            title: const Center(
              child: Text('Watch List'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 95,
                          height: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/movie1.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Jurassic World'),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
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
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.airplane_ticket,
                              color: Colors.grey,
                            ),
                            Text(
                              'Action',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                            Text(
                              '2019',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.watch_later,
                              color: Colors.grey,
                            ),
                            Text(
                              '139 minutes',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 95,
                          height: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/movie2.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Spiderman'),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.star_border,
                              color: Colors.orange,
                            ),
                            Text(
                              '8.5',
                              style: TextStyle(
                                color: Colors.orange,
                              ),
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.airplane_ticket,
                              color: Colors.grey,
                            ),
                            Text(
                              'Action',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                            Text(
                              '2021',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.watch_later,
                              color: Colors.grey,
                            ),
                            Text(
                              '139 minutes',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              // textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // bottomNavigationBar: Container(
          //   height: MediaQuery.of(context).size.height * 0.08,
          //   padding: const EdgeInsets.only(top: 1),
          //   decoration: const BoxDecoration(color: AppTheme.textBlueColor),
          //   child: BottomNavigationBar(
          //     iconSize: 32,
          //     currentIndex: selectedIndex,
          //     onTap: (index) {
          //       setState(() {
          //         selectedIndex = index;
          //       });
          //     },
          //     items: const [
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         label: 'Home',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.search),
          //         label: 'Search',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.person),
          //         label: 'Profile',
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
