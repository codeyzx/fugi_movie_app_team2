import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/movie_detail.dart';

class Cast extends StatelessWidget {
  final List<ProductionCompany> content;
  const Cast({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: content.length,
        itemBuilder: ((context, index) {
          var production = content[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0.sp),
                    color: Colors.grey[200],
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //       production.logoPath != null ? 'https://image.tmdb.org/t/p/w500${production.logoPath}' : ''),
                    //   // fit: BoxFit.fitHeight,
                    // ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/w500${production.logoPath}",
                    height: MediaQuery.of(context).size.height * .5.sp,
                    fit: BoxFit.fitHeight,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 10.0.sp),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(production.name ?? ''),
                      SizedBox(height: 5.0.sp),
                      Text(production.originCountry ?? ''),
                    ],
                  ),
                ),
                // ListTile(
                //   leading: CircleAvatar(
                //     radius: 50.0.sp,
                //     backgroundColor: Colors.grey,
                //     backgroundImage: NetworkImage(
                //       'https://image.tmdb.org/t/p/w500${production.logoPath}',
                //     ),
                //   ),
                //   title: Text(
                //     '${production.name}',
                //     style: TextStyle(
                //       fontWeight: FontWeight.normal,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        }),
        // child: Column(
        //   children: [
        //     CircleAvatar(
        //       radius: 50,
        //       backgroundImage: NetworkImage('${content.logoPath}'),
        //     ),
        //     SizedBox(height: 10),
        //     Text('${content.name}'),
        //   ],
        // ),
      ),
    );
  }
}
