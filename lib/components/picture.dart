class Picture {
  final String src;
  final int id;
  final String sort;

  Picture({required this.src, required this.id, required this.sort});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(src: json['src'] as String, id: json['id'] as int, sort: json['sort'] as String);
  }
}
