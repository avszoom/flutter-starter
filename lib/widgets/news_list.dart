import 'dart:math';

import 'package:flutter/material.dart';
import 'package:samachar/apis/NewsArticleApi.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/utils/Util.dart';
import 'package:samachar/widgets/news_article.dart';

class NewsList extends StatefulWidget {
  const NewsList({ Key? key }) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  
  late List<NewsArticle> _articleWidget;
  bool _isLoading = true;

  Future<void> _fetchDataAndPopulateList() async {
    List<NewsArticleModel> articles = [];
    try{
      articles = await NewsArticeApi().fetchNews();
    } catch (e) {
      print(e.toString());
    }
    var filteredArticles = filterConsecutiveRepeatedArticles(articles);
    filteredArticles.shuffle(Random());
    var articleWidget = filteredArticles.map((article) => NewsArticle(article: article)).toList();
    setState(() {
      _articleWidget = articleWidget;
      _isLoading = false;
    });
  }

  @override 
  void initState(){
    super.initState(); // Always call super.initState() first
    _fetchDataAndPopulateList(); //intelligent 
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return _isLoading? const Scaffold(
      body: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Samachar.....', // Replace with your word
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontFamily: 'Roboto'
              ),
            ),
            CircularProgressIndicator(),
          ],
    ) )
    ):Scaffold(
      body: Container(
        margin: const EdgeInsets.all(0),
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: controller,
          children: _articleWidget,
        ) 
      )
    );
  }
  }