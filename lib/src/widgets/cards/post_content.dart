import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  final String name;
  final String image;
  final String headingText;
  final String summaryText;
  final String routeName;

  PostContent({
    required this.name,
    required this.image,
    required this.headingText,
    required this.summaryText,
    required this.routeName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          print(this.routeName);
          Navigator.pushNamed(context, this.routeName);
        },
        child:Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(
                maxRadius: 100.0,
                backgroundColor: Colors.transparent,
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: Image.asset(image),
                      ),
                    )
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  headingText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
      )
    );
  }
}
