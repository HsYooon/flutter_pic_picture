class Item {
  String title;
  String author;
  String image;
  int heartCount;

  Item(
      {required this.title,
      required this.author,
      required this.image,
      required this.heartCount});
}

List<Item> itemList = [
  Item(title: "Red1", author: "Author_1", image: "red_1", heartCount: 10),
  Item(title: "Red2", author: "Author_2", image: "red_2", heartCount: 18),
  Item(title: "Yellow3", author: "Author_3", image: "yellow_3", heartCount: 50),
  Item(title: "Yellow4", author: "Author_4", image: "yellow_4", heartCount: 50),
  Item(title: "Green1", author: "Author_5", image: "green_1", heartCount: 50),
  Item(title: "Purple2", author: "Author_6", image: "purple_2", heartCount: 50)
];
