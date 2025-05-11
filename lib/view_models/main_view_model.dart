import 'dart:async';
import 'package:book_search/models/book_model.dart';
import 'package:book_search/services/web_service.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  List<BookModel>? _books;
  final WebService _webService = WebService();
  Timer? _debounce;

  MainViewModel();

  List<BookModel>? get books => _books;

  Future<void> setup() async {
    _books = null;
    _books = await _webService.fetchTrendingBooks();
    notifyListeners();
  }

  void searchBooks(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      _books = null;
      notifyListeners();

      _books = await _webService.fetchWithQuery(query);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
