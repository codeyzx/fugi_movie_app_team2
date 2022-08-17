import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../common_config/palette.dart';
import '../../home/presentation/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = 'splashScreen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        backgroundColor: Palette.team2color,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/icons/splash_icon.png",
                alignment: Alignment.bottomCenter,
              ),
              Positioned(
                top: 55.0.sp,
                left: 0.0.sp,
                right: 0.0.sp,
                bottom: 0.0.sp,
                child: Center(
                  child: SizedBox(
                    width: 50.sp,
                    height: 50.sp,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Palette.team2color,
                      strokeWidth: 7.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Palette.team2color.shade700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future initPage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    // if (activatedStatus == 'activated') {
    context.goNamed(HomeScreen.routeName);
    // } else {
    // context.goNamed(LoginScreen.routeName);
    // }
  }
}