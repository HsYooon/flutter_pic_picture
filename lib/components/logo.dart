import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pick Picture",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 158, 10, 1)),
        ),
        SizedBox(
          height: 60,
        )
      ],
    );
  }
}
