import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/botnavbar_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../common_config/app_theme.dart';
import '../../../movie_detail/presentation/movie_detail_screen.dart';
import '../../../search/presentation/widgets/movie_item_widget.dart';

class ImageNumberWidget<T> extends StatefulHookConsumerWidget {
  // final Trending trending;
  final int number;
  final T trending;
  final String? type;
  const ImageNumberWidget({
    Key? key,
    required this.number,
    required this.trending,
    this.type,
  }) : super(key: key);

  @override
  _ImageNumberWidgetState createState() => _ImageNumberWidgetState();
}

class _ImageNumberWidgetState extends ConsumerState<ImageNumberWidget> {
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

    return InkWell(
      onTap: () {
        context.pushNamed(
          MovieDetailScreen.routeName,
          extra: {
            "id": widget.trending.id,
            "object": widget.trending,
            "type": widget.type,
          },
        );
        ref.read(movieDetailAccessFromProvider.state).state = BotNavBarScreen.routeName;
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 20.5.sp),
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
                // child: Image.network(
                //   'https://image.tmdb.org/t/p/w500/${widget.trending.posterPath}',
                // ),
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w300/${widget.trending.posterPath}",
                  height: MediaQuery.of(context).size.height * .4.sp,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Positioned(
            top: Platform.isIOS ? 115.0.sp : 87.5.sp,
            left: -2.5.sp,
            child: Stack(
              children: [
                FittedBox(
                  child: Text(
                    '${widget.number}',
                    style: TextStyle(
                      fontSize: Platform.isIOS ? 100.0.sp : 120.sp,
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
                      fontSize: Platform.isIOS ? 100.0.sp : 120.sp,
                      color: AppTheme.primaryColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _updatePalettes() async {
    final generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(
        'https://image.tmdb.org/t/p/w500/${widget.trending.posterPath}',
      ),
    );
    _colors.add(generator.lightVibrantColor ?? generator.lightMutedColor ?? PaletteColor(Colors.teal, 2));

    if (mounted) {
      setState(() {});
    }
  }
}
