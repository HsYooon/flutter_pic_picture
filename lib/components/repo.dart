import 'package:flutter_store/components/picture.dart';

class Repo {
  final int id;
  final String name;
  List<Picture> list = [];

  Repo( this.id, this.name);

  void add(Picture pic) {
    list.add(pic);
  }

  List<Picture> get() {
    return list;
  }
}

/*
  search word -> api 요청 -> list 형태로 받아옴 ex. ['aaaaa','bbbb','cccc',  ... ]
  한번 받아오면 저장해놓고 사용

  Repo, Repo, ... 여러개 생성됨

  Repo 이름을 검색어로 지정하기

*/
