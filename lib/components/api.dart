import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_store/components/picture.dart';
import 'package:http/http.dart' as http;

class Api {
  static String flask = 'http://localhost:5000';
  static String scrapy = 'http://localhost:9080/crawl.json';
  static String target = 'https://unsplash.com/s/photos';

  static List<Picture> RED = [];
  static List<Picture> YELLOW = [];
  static List<Picture> GREEN = [];
  static List<Picture> PURPLE = [];

  // 초기화시 실행
  static String init() {
    List keywords = ['yellow'];
    // ['red','yellow','green','purple'];
    // { red : List<Picture> , yellow : List<Picture>, green : List<Picture>, purple : List<Picture>}

    for (var keyword in keywords) {
      var list = fetchImgSrc(keyword);
    }
    return "ok";
  }

  static bool? checkRepo(String keyword) {
    print("REPO LENGTH ------------> ");
    print(YELLOW.length);
    switch (keyword) {
      case 'red':
        return RED.length > 0 ? true : false;
      case 'yellow':
        return YELLOW.length > 0 ? true : false;
      case 'green':
        return GREEN.length > 0 ? true : false;
      case 'purple':
        return PURPLE.length > 0 ? true : false;
    }
  }

  // 키워드 받아 실행 {}

  //크롤링 호스트와 연결
  static Future<List<Picture>> fetchImgSrc(String keyword) async {
    /*
    String spiderName = 'myspider';
    String callback = 'parse';
    String url = scrapy +
        '?spider_name=' +
        spiderName +
        '&callback=' +
        callback +
        '&url=' +
        target +
        '/' +
        keyword;
    // scrapyrt 에서 크롤링 결과 받아옴
    // ['https://images.unsplash.com/photo-1579613832125-5d34a13ffe2a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXBwbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60 400w', ... ]
    */
    print('checkRepo 실행 -------------->');
    if (checkRepo(keyword) == true) {
      switch (keyword) {
        case 'red':
          return RED;
        case 'yellow':
          return YELLOW;
        case 'green':
          return GREEN;
        case 'purple':
          return PURPLE;
      }
    } else {
      print('fetch 실행 -------------->');
      var response = await http.get(Uri.parse('http://192.168.0.19:5000/' + keyword));
      if (response.statusCode == 200) {
        Future<List<Picture>> result = compute(parsePicture, response.body);
        result.then((value) => save(value, keyword));
        return result;
      }
      print("REPO YELLOW LENGTH ------------> ");
      print(YELLOW.length);
    }
    return [];
  }

  static void save(List<Picture> result, String keyword) {
    print("save method start ------------> ");
    switch (keyword) {
      case 'red':
        RED = result;
        break;
      case 'yellow':
        YELLOW = result;
        break;
      case 'green':
        GREEN = result;
        break;
      case 'purple':
        PURPLE = result;
        break;
    }
  }

  static List<Picture> parsePicture(String responseBody) {
    print("parsePicture method start ------------> ");
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Picture> list = parsed.map<Picture>((json) => Picture.fromJson(json)).toList();
    print("parsePicture method end ----------->");

    return list;
  }
/*
  List getImgSrcList(String name) {
    // name : 카테고리 이름
    return testRList;
  }*/
}
