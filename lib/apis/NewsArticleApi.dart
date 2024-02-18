
import 'dart:convert';

import 'package:starter/model/NewsArticleModel.dart';
import 'package:http/http.dart' as http;

class NewsArticeApi {

  NewsArticeApi();

  Future<List<NewsArticleModel>> fetchNews() async {
    final response = await http.get(Uri.parse('https://news-backend-ecru.vercel.app/news'));
    if (response.statusCode == 200) {
      List<dynamic> newsArticles = jsonDecode(response.body);
      return  newsArticles.map((article) => NewsArticleModel.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}