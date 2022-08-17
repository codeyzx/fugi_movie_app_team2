import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/common_config/app_theme.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '6.3',
                style: TextStyle(color: AppTheme.textBlueColor),
              )
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}