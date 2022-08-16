import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/detailscreen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            ElevatedButton(
                onPressed: () =>
                    GoRouter.of(context).pushNamed(DetailScreen.routeName),
                child: Text('Detail'))
          ],
        ),
      ),
    );
  }
}
