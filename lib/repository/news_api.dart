import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article_model.dart';
import '../repository/abstract_class_ropository.dart';
import '../model/articles_list_model.dart';

class NewsApi extends ClassRepository {
  final String keyApi = "c887c172db40457a952a3caeb7e5ccab";
  // final String baseUrl = "https://newsapi.org/v2/top-headlines";
  final String baseUrl = "https://newsapi.org/v2/everything";
  // https://newsapi.org/v2/everything

  @override
  Future<List<ArticleModel>> getAllNews() async {
    final url =
        "$baseUrl?q=tesla&from=2023-05-02&sortBy=publishedAt&apiKey=$keyApi";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final articles = ArticlesListModel.fromMap(jsonData);
        return articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
      } else {
        print("status code: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Failed to fetch news");
  }

  @override
  Future<List<ArticleModel>> getCategory(String publishedAt) async {
    final url =
        "$baseUrl?q=tesla&from=2023-05-02&sortBy=$publishedAt&apiKey=$keyApi";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final articles = ArticlesListModel.fromMap(jsonData);
        return articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
      } else {
        print("status code: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Failed to fetch news");
  }
}
