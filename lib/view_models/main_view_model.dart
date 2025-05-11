import 'package:book_search/models/book_model.dart';
import 'package:book_search/services/web_service.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  List<BookModel>? _books;

  WebService _webService = WebService();

  MainViewModel();

  Future<void> setup() async {
    _books = await _webService.fetchTrendingBooks();
    notifyListeners();
  }
}
