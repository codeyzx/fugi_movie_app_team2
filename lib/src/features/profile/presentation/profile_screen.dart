import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';
import 'package:fugi_movie_app_team2/src/features/movie_detail/presentation/movie_watchlist.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../movie_detail/presentation/movie_watchlist_controller.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'profile-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistState = ref.watch(watchlistControllerProvider);

    return SafeArea(
      top: false,
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: 1.sw,
              height: 165.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          'https://res.cloudinary.com/flutter-user-group-indonesia/image/upload/v1661744287/avatar_yahya_16ad6d8033.png',
                          width: 54.w,
                          height: 54.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 12.0.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250.0.w,
                            child: Text(
                              'Yahya',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              '@fugi_movie',
                              style: TextStyle(
                                color: AppTheme.textBlueColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${watchlistState?.length} ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Watchlist",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: AppTheme.thirdColor,
              thickness: 1.h,
              height: 0.h,
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Account",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/user-profile.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: AppTheme.textColorProfile,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppTheme.textColorProfile,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () => context.pushNamed(WatchlistScreen.routeName),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/watchlist-icon.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Watch List',
                                style: TextStyle(
                                  color: AppTheme.textColorProfile,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppTheme.textColorProfile,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Help",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/contact-icon.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Contact',
                                style: TextStyle(
                                  color: AppTheme.textColorProfile,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppTheme.textColorProfile,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/report-icon.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Report Problem",
                                style: TextStyle(
                                  color: AppTheme.textColorProfile,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppTheme.textColorProfile,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Other",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/terms-icon.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Terms of Service",
                                style: TextStyle(
                                  color: AppTheme.textColorProfile,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppTheme.textColorProfile,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/privacy-icon.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  color: AppTheme.textColorProfile,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppTheme.textColorProfile,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/rate-icon.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rate",
                                style: TextStyle(
                                  color: AppTheme.textColorProfile,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppTheme.textColorProfile,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/logout-icon.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 282.w,
                          height: 33.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.red,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
