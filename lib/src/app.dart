import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_router.dart';
import 'common_config/palette.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Movie Apps 2nd Team',
          theme: ThemeData(
            primarySwatch: Palette.movieDarkPrimary,
            dividerColor: Colors.transparent,
          ),
          routerDelegate: goRouter.routerDelegate,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
        );
      },
    );
  }
}
