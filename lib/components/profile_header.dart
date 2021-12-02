import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 150,
          width: 20,
        ),
        _buildHeaderAvatar(),
        SizedBox(
          height: 150,
          width: 10,
        ),
        _buildHeaderProfile("email", "name"),
        SizedBox(
          height: 150,
          width: 25,
        ),
        _buildWishList(context)
      ],
    );
  }
}

Widget _buildHeaderProfile(String email, String name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Jamie",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      Text(
        "Jamie123@gmail.com",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
      ),
    ],
  );
}

Widget _buildHeaderAvatar() {
  return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/avatar.png"),
      ));
}

int _like = 20;

Widget _buildWishList(BuildContext context) {
  return SizedBox(
    child: Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/wishList");
            },
            icon: Icon(Icons.favorite,
                size: 30, color: Color.fromRGBO(255, 102, 102, 1)),
          ),
          Text('$_like'),
        ],
      ),
    ),
  );
}
