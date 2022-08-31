import 'package:flutter/material.dart';

class CastCard extends StatelessWidget {
  final List listData;
  const CastCard({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                color: Colors.transparent,
                width: 110,
                height: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: listData[index]['profile_path'] == null
                      ? const Center(
                          child: Text(
                            "No Image",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : Image.network(
                          'https://image.tmdb.org/t/p/w92/${listData[index]['profile_path']}',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('${listData[index]['name']}'),
            ],
          );
        },
      ),
    );
  }
}
