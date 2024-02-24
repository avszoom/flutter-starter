import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/apis/NewsArticleApi.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/model/NewsArticleProvider.dart';
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

  void _setWidgets() {
    Future.delayed(Duration.zero, () async {
      var filteredArticles = Provider.of<NewsArticleProvider>(context,listen: false);
      var articleWidget = filteredArticles.articles.map((article) => NewsArticle(article: article)).toList();
      setState(() {
        _articleWidget = articleWidget;
        _isLoading = false;
      });
    });
  }

  @override 
  void initState(){
    super.initState(); // Always call super.initState() first
    // _fetchDataAndPopulateList(); //intelligent 
    _setWidgets();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return _isLoading? Scaffold(
      body: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const CircularProgressIndicator(),
            ),
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