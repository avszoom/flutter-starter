import 'dart:math';

import 'package:flutter/material.dart';
import 'package:samachar/apis/NewsArticleApi.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/utils/Util.dart';

class NewsArticleProvider extends ChangeNotifier{
   List<NewsArticleModel> _articles = [];

   List<NewsArticleModel> get articles => _articles;

  Future<void> fetchArticles() async {
     List<NewsArticleModel> articles = [];
      try{
        articles = await NewsArticeApi().fetchNews();
      } catch (e) {
        // print(e.toString());
      }
      var filteredArticles = filterConsecutiveRepeatedArticles(articles);
      filteredArticles.shuffle(Random());
      _articles =  filteredArticles;
      notifyListeners();
   }
}