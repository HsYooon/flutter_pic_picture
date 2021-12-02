import 'package:flutter/material.dart';

import 'like_button.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var liked = false;

    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  var tab = ["red", "yellow", "green", "purple"];

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: const Color(0xff959595),
      indicatorWeight: 4,
      indicatorColor: Color(0xff4961F6),
      tabs: List.generate(
        tab.length,
        (index) => new Tab(
            child: Text(tab[index],
                style: TextStyle(fontSize: 13, color: Colors.black))),
      ),
    );
  }

  var title = [
    "Engin Akyurt",
    "Ignacio Pales",
    "cottonbro",
    "Suzy Hazelwood",
    "Elle Hughes",
    "Eric Mclean"
  ];

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: List.generate(
          tab.length,
          (idx) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                    child: Stack(children: <Widget>[
                      Image.asset("assets/images/${tab[idx]}_${index + 1}.jpg"),
                      Column(children: [
                        Container(
                          width: 200,
                          height: 120,
                        ),
                        Container(
                            width: 200,
                            height: 55,
                            color: Colors.black38,
                            child: Row(children: [
                              SizedBox(width: 20, height: 20),
                              Text(title[index],
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFFFFFFF)))
                            ]))
                      ]),
                      LikeButton()
                    ]),
                  ))),
    );
  }
}
