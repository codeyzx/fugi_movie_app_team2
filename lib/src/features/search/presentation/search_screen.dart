import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/trending.dart';
import 'package:fugi_movie_app_team2/src/features/search/widgets/movie_item_widget.dart';

import '../../../common_config/app_theme.dart';
import '../../../core/client/dio_client.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = 'search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = false;
  List<Trending> trendings = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppTheme.secondaryColor,
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: AppTheme.textBlueColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: AppTheme.thirdColor,
                          size: 32,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: AppTheme.thirdColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: AppTheme.textBlueColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  )),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Expanded(
                      child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 15.0.sp),
                      itemCount: trendings.length,
                      itemBuilder: (context, index) {
                        return MovieItemWidget(
                          imagePath: trendings[index].posterPath,
                          title: trendings[index].name,
                          rating: trendings[index].voteAverage?.toStringAsFixed(1),
                          date: trendings[index].firstAirDate?.toString().split('-').first,
                        );
                      },
                    )),
            ],
          ),
        ));
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    var resp = await DioClient().apiCall(
      url: '/trending/all/week',
      requestType: RequestType.get,
      queryParameters: {
        'language': 'en-US',
      },
    );
    List<dynamic> listTrending = resp.data['results'];
    List<Trending> myTrendings = listTrending.map((e) => Trending.fromJson(e)).toList();
    setState(() {
      trendings = myTrendings;
      isLoading = false;
    });
  }
}
