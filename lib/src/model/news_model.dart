class NewsModel {
  String title;
  String text;
  List<String> images;
  DateTime date;
  int likes;
  int dislikes;

  NewsModel({
    required this.title,
    required this.images,
    required this.text,
    required this.date,
    required this.likes,
    required this.dislikes,
  });
}
