import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String headline;
  final String body;
  final String image;
  final String time;
  final bool isLiked;

  PostCard({required this.name,
        required this.headline,
        required this.body,
        required this.image,
        required this.time,
        required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(image),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                     Text(
                       headline,
                       style: TextStyle(fontSize: 16.0, color: Colors.grey),
                     ),
                    Text(
                      time,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              body,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                        size: 20.0,
                        color: isLiked ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Sentiment',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.price_change,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.change_circle,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Change',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
