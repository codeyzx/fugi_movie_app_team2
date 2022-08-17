import 'package:flutter/material.dart';

import '../../../../common_config/palette.dart';

class MovieStatus extends StatelessWidget {
  IconData? icon;
  String? text;

  MovieStatus({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon ?? Icons.abc,
          color: Palette.team2color[200],
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text ?? 'asdsa',
          style: TextStyle(color: Palette.team2color[200]),
        ),
      ],
    );
  }
}
