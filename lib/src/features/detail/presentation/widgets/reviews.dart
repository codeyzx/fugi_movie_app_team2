import 'package:flutter/material.dart';
import '../widgets/review_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        ReviewCard(),
        ReviewCard(),
        ReviewCard(),
        ReviewCard(),
      ],
    ));
  }
}
