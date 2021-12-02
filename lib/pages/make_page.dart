import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakePage extends StatefulWidget {
  const MakePage({Key? key}) : super(key: key);

  @override
  _MakePageState createState() => _MakePageState();
}

class _MakePageState extends State<MakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _makeNew(context),
        Expanded(
          child: _widgets(),
        )
      ],
    ));
  }
}

/* 새로운 위젯 생성 */
Widget _makeNew(BuildContext context) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: DottedBorder(
          color: Colors.orange,
          strokeWidth: 1,
          dashPattern: [10, 5],
          child: Container(
            height: 120,
            color: Colors.white,
          ),
        ),
      ),
      Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 60,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  createWidget(context);
                },
                child: Icon(Icons.add),
                color: Colors.white,
                shape: CircleBorder(side: BorderSide.none),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

void createWidget(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        var titleController = TextEditingController();
        var descController = TextEditingController();
        return AlertDialog(
          title: Text('test'),
          content: ListView(
            shrinkWrap: true,
            children: [
              Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 1,
                    color: Colors.orange,
                  ))),
              SizedBox(
                width: 50,
                child: TextFormField(
                  controller: titleController,
                ),
              ),
              TextFormField(
                controller: descController,
              )
            ],
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Submit"))
          ],
        );
      });
}

/* 위젯들 */
Widget _widgets() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    child: CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _item(index, widgetTitle[index], widgetDesc[index]);
          }, childCount: 5),
        ),
      ],
    ),
  );
}

Widget _item(int index, String title, String desc) {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: 50,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Image.asset(
                  "assets/images/make_${index + 1}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                      child: Text(
                    "title",
                    style: TextStyle(fontSize: 10),
                  )),
                  Container(child: Text(title)),
                  SizedBox(height: 40),
                  Text(
                    "Description",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

/* 임시 데이터 List*/
/* imgName, title, description */

var widgetTitle = [
  'Rising sun',
  'Afternoon',
  'Evergreen',
  'vitamin',
  'Christmas'
];
var widgetDesc = [
  'a situation in which a group of people protest against, and try to get rid of, a government, a leader, etc.',
  'the period of time from 12 o\'clock in the middle of the day until about 6 o’clock in the evening',
  'that has green leaves all through the year',
  'that has green leaves all through the year',
  'that has green leaves all through the year'
];
