import 'package:book_search/data/constants.dart';
import 'package:book_search/models/book_model.dart';
import 'package:http/http.dart' as http;

class WebService {
  WebService();

  Future<List<BookModel>> fetchWithQuery(String query) async {
    Uri url = Uri.parse("${K.searchApiUrl}?q=$query&sort=readinglog");
    var response = await http.get(url);
    print(response);

    return [];
  }

  Future<List<BookModel>> fetchTrendingBooks() async {
    return await fetchWithQuery("all");
  }
}
