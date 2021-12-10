
class Api {

  List testRList = [
    'https://images.unsplash.com/photo-1576718388983-e3ab696f2b8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=200&q=60',
    'https://images.unsplash.com/photo-1507471509451-1d04d60f896d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=200&q=60',
    'https://images.unsplash.com/photo-1615012553971-f7251c225e01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=200&q=60'
  ];

  //크롤링 호스트와 연결


  List getImgSrcList(String name) {
    // name : 카테고리 이름
    return testRList;
  }


}
