import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  final String content;
  const Reviews({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        content,
      ),
      // child: ListView(
      //   children: [
      //     ReviewCard(),
      //     ReviewCard(),
      //     ReviewCard(),
      //     ReviewCard(),
      //   ],
      // ),
    );
  }
}
