import 'package:flutter/material.dart';
import 'package:flutter_store/model/item.dart';
import 'package:flutter_store/theme.dart';

class ItemDetail extends StatelessWidget {
  final Item item;
  ItemDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: textTheme().bodyText1,
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text('@${item.author}'),
        const SizedBox(
          height: 4.0,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(child: _buildIcon(item.heartCount, Icons.favorite)),
          ],
        )
      ],
    ));
  }
}

Widget _buildIcon(int count, IconData iconData) {
  return Row(
    children: [
      Icon(iconData, size: 14.0),
      const SizedBox(width: 4.0),
      Text('$count'),
    ],
  );
}
