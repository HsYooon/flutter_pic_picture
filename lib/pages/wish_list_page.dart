import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/components/wish_item.dart';
import 'package:flutter_store/model/item.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Text('wishlist'),
              SizedBox(width: 4.0),
              Icon(
                CupertinoIcons.chevron_down,
                size: 15.0,
              )
            ],
          ),
          backgroundColor: const Color.fromRGBO(255, 158, 10, 1),
          actions: [
            IconButton(
                icon: const Icon(CupertinoIcons.search), onPressed: () {}),
            IconButton(
                icon: const Icon(CupertinoIcons.list_dash), onPressed: () {}),
            IconButton(icon: const Icon(CupertinoIcons.bell), onPressed: () {}),
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return WishItem(item: itemList[index]);
            },
            separatorBuilder: (context, index) => const Divider(
                  height: 0,
                  indent: 16,
                  endIndent: 16,
                  color: Colors.grey,
                ),
            itemCount: itemList.length));
  }
}
