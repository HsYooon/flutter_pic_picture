import 'package:flutter/material.dart';
import 'package:flutter_store/components/item_detail.dart';
import 'package:flutter_store/model/item.dart';

class WishItem extends StatelessWidget {
  final Item item;
  WishItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "assets/images/${item.image}.jpg",
                width: 115,
                height: 115,
                fit: BoxFit.cover,
              )),
          const SizedBox(width: 16.0),
          ItemDetail(item: item)
        ],
      ),
    );
  }
}
