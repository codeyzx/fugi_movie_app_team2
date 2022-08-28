import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_config/palette.dart';

class MovieStatus extends StatelessWidget {
  IconData? icon;
  String? text;

  MovieStatus({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon ?? Icons.abc,
          color: Palette.team2color[200],
          size: 16.0.sp,
        ),
        SizedBox(height: 5.0.sp),
        Text(
          text ?? 'asdsa',
          style: TextStyle(
            color: Palette.team2color[200],
            fontSize: 10.0.sp,
          ),
        ),
      ],
    );
  }
}
