
import 'dart:convert';

import 'package:starter/model/NewsArticleModel.dart';
import 'package:http/http.dart' as http;

class NewsArticeApi {

  NewsArticeApi();

  Future<List<NewsArticleModel>> fetchNews() async {
    final now = DateTime.now();
    String fromDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    final response = await http.get(Uri.parse('https://news-backend-ecru.vercel.app/news?fromDate=$fromDate&toDate=$fromDate'));
    if (response.statusCode == 200) {
      List<dynamic> newsArticles = jsonDecode(response.body);
      return  newsArticles.map((article) => NewsArticleModel.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}