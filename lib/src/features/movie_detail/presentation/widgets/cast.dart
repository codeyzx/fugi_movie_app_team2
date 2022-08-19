import 'package:flutter/material.dart';

class Cast extends StatelessWidget {
  const Cast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: GridView.builder(
          itemCount: 1,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: ((context, index) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Name')
              ],
            );
          })),
    );
  }
}
