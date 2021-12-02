import 'package:flutter/material.dart';
import 'package:flutter_store/pages/home_page.dart';
import 'package:flutter_store/pages/login_page.dart';
import 'package:flutter_store/pages/main_page.dart';
import 'package:flutter_store/pages/wish_list_page.dart';
import 'package:flutter_store/theme.dart';

import 'components/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/main",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/main": (context) => MainPage(),
        "/wishList": (context) => WishListPage(),
        "/test": (context) => MyHomePage(
              title: 'test',
            ),
      },
      home: HomePage(),
    );
  }
}
