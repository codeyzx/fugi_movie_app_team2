import 'package:flutter/material.dart';

class AboutMovie extends StatelessWidget {
  final String content;
  const AboutMovie({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          content,
        ));
  }
}
