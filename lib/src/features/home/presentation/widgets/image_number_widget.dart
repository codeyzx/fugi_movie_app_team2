import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/features/detail/presentation/detail_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_config/app_theme.dart';

class ImageNumberWidget extends StatelessWidget {
  final int number;
  const ImageNumberWidget({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: (() => GoRouter.of(context).goNamed(DetailScreen.routeName)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(
                'assets/images/movie1.png',
              ),
            ),
            Positioned(
              bottom: -20,
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
      ),
    );
  }
}
