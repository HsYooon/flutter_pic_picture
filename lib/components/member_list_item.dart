import 'package:flutter/material.dart';

class MemberListItem extends StatelessWidget {
  final String memberName;
  final String title;
  final String info;

  const MemberListItem(this.memberName, this.title, this.info);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            AspectRatio(
              aspectRatio: 5 / 3,
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/$memberName.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              info,
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ));
  }
}
