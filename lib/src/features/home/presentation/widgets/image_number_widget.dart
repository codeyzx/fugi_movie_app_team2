import 'package:flutter/material.dart';

import '../../../../common_config/app_theme.dart';

class ImageNumberWidget extends StatelessWidget {
  final int number;
  const ImageNumberWidget({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset('assets/images/movie1.png'),
          ),
          Positioned(
            bottom: -20,
            child: Stack(
              children: [
                Text(
                  '$number',
                  style: TextStyle(
                    // color: AppTheme.primaryColor,
                    fontSize: 120,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = AppTheme.textBlueColor,
                  ),
                ),
                Text(
                  '$number',
                  style: const TextStyle(
                    fontSize: 120,
                    color: AppTheme.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
