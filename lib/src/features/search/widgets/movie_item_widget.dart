import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? rating;
  final String? date;
  const MovieItemWidget({
    Key? key,
    this.imagePath,
    this.title,
    this.rating,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 95,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: Image.network(
                    'https://image.tmdb.org/t/p/w780/$imagePath',
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? ''),
              const SizedBox(
                height: 10,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star_border,
                    color: Colors.orange,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    rating ?? '',
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.airplane_ticket,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Action',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    date ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.watch_later,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '139 minutes',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
