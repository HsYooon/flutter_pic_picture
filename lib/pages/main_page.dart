import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/components/api.dart';
import 'package:flutter_store/components/picture.dart';
import 'package:flutter_store/components/repo.dart';
import 'package:flutter_store/pages/search_page.dart';
import 'package:flutter_store/pages/wish_list_page.dart';

import 'make_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  int _resultWishCount = 0;
  int _bgCode = 0;
  var _bgColor = {
    0: Color.fromRGBO(227, 60, 54, 0.8),
    1: Color.fromRGBO(255, 218, 117, 1),
    2: Color.fromRGBO(65, 156, 121, 1),
    3: Color.fromRGBO(116, 104, 191, 1)
  };

  Repo redRepo = Repo(0, 'Red');
  Repo yellowRepo = Repo(1, 'Yellow');
  Repo greenRepo = Repo(2, 'Green');
  Repo purpleRepo = Repo(3, 'Purple');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _bgColor[_bgCode],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Pick Picture",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: IndexedStack(index: _selectedIndex, children: [
          Column(
            children: [
              const SizedBox(width: 10),
              ProfileHeader(),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: ProfileTab()),
            ],
          ),
          MakePage(),
          SearchPage(),
          WishListPage(),
        ]),
        bottomNavigationBar: FancyBottomNavigation(
          circleColor: const Color.fromRGBO(237, 137, 50, 0.9),
          activeIconColor: Colors.white,
          inactiveIconColor: const Color.fromRGBO(237, 137, 50, 0.9),
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.camera, title: "make"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.favorite, title: "wish"),
          ],
          onTabChangedListener: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}

/**
 * ProfileHeader 헤더
 * */

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  int _resultWishCount = 0;
  @override
  Widget build(BuildContext context) {
    _MainPageState? _mainPageState = context.findAncestorStateOfType<_MainPageState>();

    _resultWishCount = _mainPageState!._resultWishCount;

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
        _buildWishList(context, _resultWishCount)
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      Text(
        "Jamie123@gmail.com",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
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

Widget _buildWishList(BuildContext context, int resultWishCount) {
  return SizedBox(
    child: Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/wishList");
            },
            icon: Icon(Icons.favorite, size: 30, color: Color.fromRGBO(255, 102, 102, 1)),
          ),
          Text(
            '$resultWishCount',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

/**
 * ProfileTab 프로파일 탭
 */

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int wishCount = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      /* 요기요 */
      _MainPageState? _mainPageState = context.findAncestorStateOfType<_MainPageState>();
      _mainPageState!.setState(() {
        _mainPageState._bgCode = _tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _MainPageState? _mainPageState = context.findAncestorStateOfType<_MainPageState>();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_mainPageState != null && this.wishCount != _mainPageState._resultWishCount) {
        _mainPageState.setState(() {
          _mainPageState._resultWishCount = wishCount;
        });
      }
    });

    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            FutureBuilder<List<Picture>>(
              future: Api.fetchImgSrc('red'),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.data == null) {
                  return Text('no data');
                }
                return snapshot.hasData
                    ? _PictureList(pictures: snapshot.data!)
                    : Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<List<Picture>>(
              future: Api.fetchImgSrc('yellow'),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.data == null) {
                  return Text('no data');
                }
                return snapshot.hasData
                    ? _PictureList(pictures: snapshot.data!)
                    : Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<List<Picture>>(
              future: Api.fetchImgSrc('green'),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.data == null) {
                  return Text('no data');
                }
                return snapshot.hasData
                    ? _PictureList(pictures: snapshot.data!)
                    : Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<List<Picture>>(
              future: Api.fetchImgSrc('purple'),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.data == null) {
                  return Text('no data');
                }
                return snapshot.hasData
                    ? _PictureList(pictures: snapshot.data!)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ]),
        ),
      ],
    );
  }

  var tab = ["red", "yellow", "green", "purple"]; // TODO: 정리해야함

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: const Color(0xff959595),
      indicatorWeight: 4,
      indicatorColor: Colors.white,
      tabs: List.generate(
        tab.length,
        (index) =>
            new Tab(child: Text(tab[index], style: TextStyle(fontSize: 13, color: Colors.white))),
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

  // TODO: 없애야함
  Widget _buildTabBarView(List<Picture> list) {
    final List<Picture> pictures = list;

    return TabBarView(
      controller: _tabController,
      children: [],
    );
  }
}

/**
 * 이미지를 적용하는 GridView
 * */
class _PictureList extends StatefulWidget {
  final List<Picture> pictures;
  const _PictureList({Key? key, required this.pictures}) : super(key: key);

  @override
  _PictureListState createState() => _PictureListState();
}

class _PictureListState extends State<_PictureList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.pictures.length,
        itemBuilder: (pictures, index) => Container(
              child: Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 7)],
                    ),
                    child: Image.network(widget.pictures[index].src,
                        width: 200, height: 200, fit: BoxFit.cover),
                    //Image.asset("assets/images/${tab[idx]}_${index + 1}.jpg"),
                  ),
                ),
                Column(children: [
                  Container(
                    width: 200,
                    height: 110,
                  ),
                  Container(
                      width: 155,
                      height: 55,
                      color: Colors.black38,
                      child: Row(children: [
                        SizedBox(width: 20, height: 20),
                        Text("title", style: TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)))
                      ]))
                ]),
                LikeButton()
              ]),
            ));
  }
}

/**
 * LikeButton 위시 버튼
 * */

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
    _ProfileTabState? _profileTabState = context.findAncestorStateOfType<_ProfileTabState>();
    print("_profileTabState : ${_profileTabState!.wishCount}");
    return Column(children: [
      Container(width: 200, height: 110),
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
                    if (_profileTabState != null) {
                      _profileTabState.setState(() {
                        _profileTabState.wishCount -= 1;
                      });
                    }
                  } else {
                    like = true;
                    count = 1;
                    if (_profileTabState != null) {
                      _profileTabState.setState(() {
                        _profileTabState.wishCount += 1;
                      });
                    }
                  }
                });
              },
            )
          ]))
    ]);
  }
}
