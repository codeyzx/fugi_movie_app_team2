import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fugi_movie_app_team2/src/features/home/presentation/botnavbar_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_config/app_theme.dart';
import '../../home/presentation/home_screen.dart';
import 'search_controller.dart';
import 'widgets/movie_item_widget.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = 'search-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchController = useTextEditingController();
    var isLoadingSearch = useState(false);
    var isResetSearch = useState(Random().nextInt(99));

    final searchResultState = ref.watch(searchControllerProvider);
    final keywordSearchState = ref.watch(keywordsProvider);

    late List<Map<String, dynamic>> employeeDataTampungan = [];

    var debounceTimer = Timer(const Duration(milliseconds: 500), () {});
    void doDebouncing({required Function() fn, int waitForMs = 500}) {
      debounceTimer.cancel();
      debounceTimer = Timer(Duration(milliseconds: waitForMs), fn);
    }

    useEffect(() {
      return () {
        searchController.clear();
      };
    }, [isResetSearch.value]);

    // void doClear() {
    //   isResetSearch.value = Random().nextBool();
    // }

    ref.listen<AsyncValue<List<Map<String, dynamic>>?>>(
      searchControllerProvider,
      (prev, state) {
        if (!state.isRefreshing && !state.hasError) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            isLoadingSearch.value = false;
          });
          employeeDataTampungan = state.value ?? [];
        }
        if (state.isRefreshing) {
          isLoadingSearch.value = false;
        }
      },
    );

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
          child: Column(
            children: [
              // Expanded(
              //   flex: 0,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50.0.sp),
              //       color: AppTheme.secondaryColor,
              //     ),
              //     child: TextField(
              //       onChanged: (value) {
              //         ref.read(keywordsProvider.state).state = value;
              //       },
              //       onSubmitted: (value) {
              //         ref.read(searchControllerProvider.notifier).search(searchController.text.toLowerCase());
              //         isLoadingSearch.value = true;
              //       },
              //       controller: searchController,
              //       style: const TextStyle(color: AppTheme.textBlueColor),
              //       decoration: InputDecoration(
              //         contentPadding: EdgeInsets.all(15.0.sp),
              //         suffixIcon: InkWell(
              //           onTap: () => {
              //             ref.read(searchControllerProvider.notifier).search(searchController.text.toLowerCase()),
              //           },
              //           child: searchController.text.isNotEmpty
              //               ? IconButton(
              //                   onPressed: () {
              //                     searchController.clear();
              //                     isResetSearch.value = Random().nextInt(123);
              //                   },
              //                   icon: isLoadingSearch.value == true
              //                       ? const Center(child: CircularProgressIndicator())
              //                       : const Icon(
              //                           Icons.close,
              //                           color: AppTheme.textBlueColor,
              //                         ),
              //                 )
              //               : Icon(
              //                   Icons.search,
              //                   color: AppTheme.thirdColor,
              //                   size: 28.0.sp,
              //                 ),
              //         ),
              //         hintText: 'Search',
              //         hintStyle: const TextStyle(color: AppTheme.thirdColor),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(50.0.sp),
              //         ),
              //         focusColor: Colors.white,
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(50.0.sp),
              //           borderSide: const BorderSide(
              //             color: AppTheme.textBlueColor,
              //             width: 2,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0.sp),
                    color: AppTheme.secondaryColor,
                  ),
                  child: Autocomplete<Map<String, dynamic>>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Map<String, dynamic>>.empty();
                      } else {
                        doDebouncing(
                          fn: () async {
                            isLoadingSearch.value = true;
                            await ref.read(searchControllerProvider.notifier).search(textEditingValue.text.toLowerCase());
                            // debugPrint('after await debouncing');
                          },
                        );
                        return employeeDataTampungan.where((option) {
                          return option['title'].toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
                        });
                      }
                    },

                    fieldViewBuilder: (
                      context,
                      textEditingController,
                      focusNode,
                      onFieldSubmitted,
                    ) {
                      return Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            onSubmitted: (String value) {
                              onFieldSubmitted();
                            },
                            style: const TextStyle(color: AppTheme.textBlueColor),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15.0.sp),
                              hintText: 'Search',
                              hintStyle: const TextStyle(color: AppTheme.thirdColor),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0.sp)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0.sp),
                                borderSide: const BorderSide(color: AppTheme.textBlueColor, width: 2),
                              ),
                            ),
                          ),
                          if (isLoadingSearch.value == true)
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: const CircularProgressIndicator.adaptive(),
                            ),
                          if (textEditingController.text.isNotEmpty || employeeDataTampungan.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0.sp),
                              child: InkWell(
                                onTap: () {
                                  textEditingController.clear();
                                  doClosedList(ref, employeeDataTampungan);
                                  isResetSearch.value = Random().nextInt(123);
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 20.0.sp,
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
                            child: Icon(Icons.search, size: 22.0.sp, color: Colors.amber),
                          ),
                        ],
                      );
                    },
                    // optionsViewBuilder:
                    //     (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                    //   return Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Material(
                    //       elevation: 4.0,
                    //       child: SizedBox(
                    //         height: 200.0,
                    //         child: ListView.builder(
                    //           padding: const EdgeInsets.all(8.0),
                    //           itemCount: options.length,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             final String option = options.elementAt(index);
                    //             return GestureDetector(
                    //               onTap: () {
                    //                 onSelected(option);
                    //               },
                    //               child: ListTile(
                    //                 title: Text(option),
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: searchResultState.when(
                  data: (datas) {
                    return Column(
                      children: [
                        Expanded(
                            flex: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.0.sp, vertical: 10.0.sp),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Visibility(
                                      visible: datas?.length != null ? true : false,
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          Text('Finded ${datas?.length} results for keyword'),
                                          SizedBox(width: 5.0.sp),
                                          Text(
                                            '"$keywordSearchState"',
                                            style:
                                                const TextStyle(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                          child: datas != null
                              ? datas.isNotEmpty
                                  ? ListView.builder(
                                      padding: EdgeInsets.symmetric(vertical: 15.0.sp, horizontal: 15.0.sp),
                                      itemCount: datas.length,
                                      itemBuilder: (context, index) {
                                        var dataku = datas[index];
                                        ref.read(movieDetailAccessFromProvider.state).state = BotNavBarScreen.routeName;
                                        ref.read(currentIndexProvider.state).state = 1;

                                        return MovieItemWidget(
                                          imagePath: dataku['poster_path'],
                                          title: dataku['title'],
                                          rating: dataku['vote_average'].toString(),
                                          date: dataku['release_date'],
                                          movie: dataku,
                                        );
                                      },
                                    )
                                  : Container(
                                      padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/icons/search-icon.png'),
                                          SizedBox(
                                            width: 200.0.sp,
                                            child: Text(
                                              'we are sorry, we can not find the movie 😞',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text('Find your movie by Type title, categories, years, etc',
                                              style: TextStyle(fontSize: 10.0.sp)),
                                        ],
                                      ),
                                    )
                              : Container(
                                  padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icons/search-icon.png'),
                                      SizedBox(
                                        width: 200.0.sp,
                                        child: Text(
                                          'Find your movie now 😆️ !',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                  error: (e, st) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/search-icon.png'),
                        SizedBox(
                          width: 200.0.sp,
                          child: Text(
                            'Find your movie now 😆️ !',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doClosedList(WidgetRef ref, List<Map<String, dynamic>> employeeDataTampungan) {
    ref.read(searchControllerProvider.notifier).search('');
  }
}
