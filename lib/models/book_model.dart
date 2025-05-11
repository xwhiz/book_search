class BookModel {
  String title;
  List<String> authorNames;
  String ebookAccess;
  String coverUrl;
  int editionCount;
  int publishYear;
  String openLibUrl;

  BookModel({
    required this.title,
    required this.authorNames,
    required this.ebookAccess,
    required this.coverUrl,
    required this.editionCount,
    required this.publishYear,
    required this.openLibUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    String coverUrl =
        "https://covers.openlibrary.org/b/id/${json['cover_i'] as int}-L.jpg";
    String openLibUrl = "https://openlibrary.org${json['key'] as String}";

    return BookModel(
      title: json['title'] as String,
      authorNames: json['author_name'] as List<String>,
      ebookAccess: json['ebook_access'] as String,
      coverUrl: coverUrl,
      editionCount: json['edition_count'] as int,
      publishYear: json['first_publish_year'] as int,
      openLibUrl: openLibUrl,
    );
  }
}
