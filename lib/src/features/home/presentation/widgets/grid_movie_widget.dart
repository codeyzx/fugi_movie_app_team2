import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/top_rated.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/trending.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/entities/upcoming.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../movie_detail/presentation/movie_detail_screen.dart';
import '../../../search/presentation/widgets/movie_item_widget.dart';
import '../../domain/entities/popular.dart';
import '../home_botnavbar_screen.dart';

class GridMovieWidget<T> extends HookConsumerWidget {
  final List<T>? listData;
  final String type;
  const GridMovieWidget({
    super.key,
    this.listData,
    required this.type,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .7,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      padding: EdgeInsets.all(8.0.sp),
      itemCount: listData?.length,
      itemBuilder: (context, index) {
        var data = (listData is List<Upcoming>)
            ? (listData as List<Upcoming>)[index] as Upcoming
            : (listData is List<TopRated>)
                ? (listData as List<TopRated>)[index] as TopRated
                : (listData is List<Trending>)
                    ? (listData as List<Trending>)[index] as Trending
                    : (listData as List<Popular>)[index] as Popular;

        // var data = listData?[index];

        return InkWell(
          onTap: () {
            context.pushNamed(MovieDetailScreen.routeName, extra: {
              "id": (data is Upcoming)
                  ? data.id
                  : (data is TopRated)
                      ? data.id
                      : (data is Trending)
                          ? data.id
                          : (data is Popular)
                              ? data.id
                              : 0,
              "object": listData?[index],
              'type': type,
            });
            ref.read(movieDetailAccessFromProvider.notifier).state = HomeBotNavBarScreen.routeName;
          },
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0.sp),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w300/${(data is Upcoming) ? data.posterPath : (data is TopRated) ? data.posterPath : (data is Trending) ? data.posterPath : (data is Popular) ? data.posterPath : ''}",
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
