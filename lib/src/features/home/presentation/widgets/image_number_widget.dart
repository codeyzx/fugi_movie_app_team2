import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/trending.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../common_config/app_theme.dart';

class ImageNumberWidget extends StatefulWidget {
  final Trending trending;
  final int number;
  const ImageNumberWidget({
    Key? key,
    required this.number,
    required this.trending,
  }) : super(key: key);

  @override
  State<ImageNumberWidget> createState() => _ImageNumberWidgetState();
}

class _ImageNumberWidgetState extends State<ImageNumberWidget> {
  final List<PaletteColor> _colors = [];
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _updatePalettes();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate dominant color from ImageProvider

    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 20.0.sp),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.225.sp,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // color: Colors.purpleAccent.withOpacity(0.5),
                    color: _colors.isNotEmpty ? _colors[_currentIndex].color : Colors.white,
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0.sp),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${widget.trending.posterPath}',
                  scale: 1.0,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: -2.5.sp,
          top: Platform.isIOS ? 105.0.sp : 90.0.sp,
          child: Stack(
            children: [
              FittedBox(
                child: Text(
                  '${widget.number}',
                  style: TextStyle(
                    fontSize: 120.sp,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = AppTheme.textBlueColor,
                  ),
                ),
              ),
              Text('${widget.number}',
                  style: TextStyle(
                    fontSize: 120.sp,
                    color: AppTheme.primaryColor,
                  ))
            ],
          ),
        )
      ],
    );
  }

  void _updatePalettes() async {
    final generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(
        'https://image.tmdb.org/t/p/w500/${widget.trending.posterPath}',
      ),
    );
    _colors.add(generator.lightVibrantColor ?? generator.lightMutedColor ?? PaletteColor(Colors.teal, 2));
    setState(() {});
  }
}
