import 'package:flutter/material.dart';

class MemberMenu extends StatelessWidget {
  const MemberMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            _buildMenuItem("All"),
            SizedBox(width: 5),
            _buildMenuItem("Jennie"),
            _buildMenuItem("Rosse"),
            _buildMenuItem("Jisso"),
            _buildMenuItem("Risa"),
          ],
        ));
  }
}

Widget _buildMenuItem(String name) {
  return Container(
    width: 60,
    height: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            name,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    ),
  );
}
