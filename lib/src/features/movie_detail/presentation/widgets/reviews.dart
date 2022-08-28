import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reviews extends StatelessWidget {
  final String content;
  const Reviews({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 10.0.sp),
        child: Column(
          children: [
            Text(content),
          ],
        ),
      ),
    );
  }
}
