class Book {
  String id;
  String title;
  String subtitle;
  String thumbnail; // 썸네일 이미지 링크
  String previewLink; // ListTile 을 눌렀을 때 이동하는 링크
  List authors; // 저자
  String publishedDate;

  Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.thumbnail,
    required this.previewLink,
    required this.authors,
    required this.publishedDate,
  });
}
