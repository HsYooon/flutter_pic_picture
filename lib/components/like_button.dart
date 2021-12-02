import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  var like = false;
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(width: 200, height: 120),
      Container(
          width: 200,
          height: 55,
          child: Row(children: [
            SizedBox(
              width: 120,
              height: 20,
            ),
            IconButton(
              icon: like == true
                  ? Icon(Icons.favorite, color: Colors.white)
                  : Icon(Icons.favorite_outline_sharp, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (like == true) {
                    like = false;
                    count = 0;
                  } else {
                    like = true;
                    count = 1;
                  }
                });
              },
            )
          ]))
    ]);
  }
}
