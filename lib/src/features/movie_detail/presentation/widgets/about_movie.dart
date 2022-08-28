import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMovie extends StatelessWidget {
  final String? movieTitle;
  final String content;
  const AboutMovie({
    Key? key,
    this.movieTitle,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieTitle ?? '',
              style: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0.sp),
            Text(content),
          ],
        ));
  }
}
