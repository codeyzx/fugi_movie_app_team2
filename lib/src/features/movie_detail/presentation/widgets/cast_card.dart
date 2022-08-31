import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CastCard extends StatelessWidget {
  final List listData;
  const CastCard({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () => _launchUrl(listData[index]['name']),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.transparent,
                  width: 110.0.sp,
                  height: 110.0.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0.sp),
                    // child: listData[index]['profile_path'] == null
                    //     ? const Center(
                    //         child: Text(
                    //           "No Image",
                    //           style: TextStyle(color: Colors.red),
                    //         ),
                    //       )
                    //     : Image.network(
                    //         'https://image.tmdb.org/t/p/w92/${listData[index]['profile_path']}',
                    //         fit: BoxFit.cover,
                    //       ),
                    child: CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/w500/${listData[index]['profile_path']}",
                      height: MediaQuery.of(context).size.height * .4.sp,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Text('${listData[index]['name']}'),
            ],
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String param) async {
    Uri url = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: 'search',
      queryParameters: {'q': param},
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
