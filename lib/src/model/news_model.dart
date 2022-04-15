class NewsModel {
  String title;
  String text;
  List<String> images;
  DateTime date;

  NewsModel({
    required this.title,
    required this.images,
    required this.text,
    required this.date,
  });
}
