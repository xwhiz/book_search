import 'dart:convert';

import 'package:book_search/data/constants.dart';
import 'package:book_search/models/book_model.dart';
import 'package:http/http.dart' as http;

class WebService {
  WebService();

  Future<List<BookModel>> fetchWithQuery(
    String query, {
    int page = 1,
    int limit = 10,
  }) async {
    Uri url = Uri.parse(
      "${K.searchApiUrl}?q=$query&sort=readinglog&page=$page&limit=$limit",
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);

    List<BookModel> books =
        (json['docs'] as List<dynamic>)
            .map((book) => BookModel.fromJson(book))
            .toList();

    return books;
  }

  Future<List<BookModel>> fetchTrendingBooks() async {
    return await fetchWithQuery("all");
  }
}
