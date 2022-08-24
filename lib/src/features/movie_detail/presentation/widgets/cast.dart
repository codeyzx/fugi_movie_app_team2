import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team2/src/features/home/domain/movie_detail.dart';

class Cast extends StatelessWidget {
  final List<ProductionCompany> content;
  const Cast({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: content.length,
      itemBuilder: ((context, index) {
        var movie = content[index];
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.logoPath}'),
              ),
              title: Text('${movie.name}'),
            ));
      }),
      // child: Column(
      //   children: [
      //     CircleAvatar(
      //       radius: 50,
      //       backgroundImage: NetworkImage('${content.logoPath}'),
      //     ),
      //     SizedBox(height: 10),
      //     Text('${content.name}'),
      //   ],
      // ),
    );
  }
}
