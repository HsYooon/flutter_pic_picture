import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/components/date_picker_test.dart';
import 'package:flutter_store/components/round_border_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List searchKeyword = [
      'x-mas',
      'red',
      'vivid',
      'forest',
      'cotton',
      'winter'
    ];
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                disabledBorder: _buildoutLineInputBorder(),
                enabledBorder: _buildoutLineInputBorder(),
                focusedBorder: _buildoutLineInputBorder(),
                filled: true,
                fillColor: Colors.grey[100],
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.only(
                    left: 0, bottom: 15, top: 15, right: 0),
                hintText: "무엇에 관심 있으신가요?",
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 66,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: searchKeyword.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: RoundBorderText(
                      title: searchKeyword[index],
                      position: index,
                    ),
                  );
                }),
          ),
          Divider(
            color: Colors.grey[100],
            thickness: 1.0,
          ),
          DatePicker(),
        ],
      ),
    );
  }

  OutlineInputBorder _buildoutLineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
        borderRadius: BorderRadius.circular(8.0));
  }
}
