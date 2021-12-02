import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/components/member_list_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: _buildScaffold(),
    );
  }
}

AppBar _buildMemberAppBar() {
  return AppBar(
      title: const Text(
        "BLACKPINK",
        style: TextStyle(fontSize: 30),
      ),
      backgroundColor: const Color.fromRGBO(255, 170, 200, 0.74),
      elevation: 1.0,
      bottom: const TabBar(tabs: <Widget>[
        Tab(
          icon: Text("All"),
        ),
        Tab(
          icon: Text("Jennie"),
        ),
        Tab(
          icon: Text("Rosse"),
        ),
        Tab(
          icon: Text("Jisoo"),
        ),
        Tab(
          icon: Text("Lisa"),
        ),
      ]));
}

Scaffold _buildScaffold() {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: _buildMemberAppBar(),
    body: const TabBarView(
      children: <Widget>[
        MemberListItem("JENNIE", "Jennie", "@jennierubyjane"),
        MemberListItem("JENNIE", "Jennie", "@jennierubyjane"),
        MemberListItem("JISOO", "Jisoo", "@sooyaaa__"),
        MemberListItem("LISA", "Lisa", "@lalalalisa_m"),
        MemberListItem("ROSSE", "Rosse", "@roses_are_rosie"),
      ],
    ),
  );
}
