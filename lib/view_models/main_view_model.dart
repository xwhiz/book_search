import 'package:book_search/models/book_model.dart';
import 'package:book_search/services/web_service.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  List<BookModel>? _books;

  final WebService _webService = WebService();

  MainViewModel();

  get books => _books;

  Future<void> setup() async {
    _books = null;
    _books = await _webService.fetchTrendingBooks();
    notifyListeners();
  }
}
