import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../movie_detail/presentation/movie_detail_screen.dart';

class MovieItemWidget extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? rating;
  final String? date;
  final Map<String, dynamic>? movie;
  const MovieItemWidget({
    Key? key,
    this.imagePath,
    this.title,
    this.rating,
    this.date,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(MovieDetailScreen.routeName, extra: {
          "id": movie?['id'],
          "object": null,
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 87.5.sp,
              height: 120.0.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.5.sp),
                image: DecorationImage(
                    image: imagePath != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w780/$imagePath',
                          ).image
                        : Image.asset('assets/icons/no-image.png').image,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10.0.sp),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? ''),
                  SizedBox(height: 5.0.sp),
                  Row(
                    children: [
                      Icon(Icons.star_border, color: Colors.orange, size: 20.0.sp),
                      SizedBox(width: 5.0.sp),
                      Text(
                        rating ?? '',
                        style: const TextStyle(
                          color: Colors.orange,
                        ),
                        // textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(FontAwesomeIcons.ticket, color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Text('Action', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        date ?? '',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        // textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Icon(Icons.watch_later, color: Colors.grey, size: 20.0.sp),
                  //     SizedBox(width: 5.0.sp),
                  //     Text('139 minutes',
                  //         style: TextStyle(
                  //           color: Colors.grey,
                  //         )),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
