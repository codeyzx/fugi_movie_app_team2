import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/trending.dart';

import '../../../../common_config/app_theme.dart';

class ImageNumberWidget extends StatelessWidget {
  final Trending trending;
  final int number;
  const ImageNumberWidget({
    Key? key,
    required this.number,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4.sp,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.21.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0.sp),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${trending.posterPath}',
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0.sp,
            bottom: -20.0.sp,
            child: Stack(
              children: [
                Text(
                  '$number',
                  style: TextStyle(
                    // color: AppTheme.primaryColor,
                    fontSize: 120,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = AppTheme.textBlueColor,
                  ),
                ),
                Text(
                  '$number',
                  style: const TextStyle(
                    fontSize: 120,
                    color: AppTheme.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
