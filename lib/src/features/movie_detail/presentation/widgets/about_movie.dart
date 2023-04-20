import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMovie extends StatelessWidget {
  final String? movieTitle;
  final String content;
  final Color? color;
  const AboutMovie({
    Key? key,
    this.movieTitle,
    required this.content,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 10.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieTitle ?? '',
              style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
            )
                .animate()
                .fadeIn(curve: Curves.easeOutCirc)
                .then(delay: 200.ms)
                .untint(color: color)
                .blurXY(begin: 16)
                .scaleXY(begin: 1.5),
            SizedBox(height: 10.0.sp),
            Text(content),
          ],
        ),
      ),
    );
  }
}
