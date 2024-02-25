import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/model/NewsArticleProvider.dart';
import 'package:samachar/widgets/news_article.dart';

class NewsList extends StatefulWidget {
  const NewsList({ Key? key }) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  
  late List<NewsArticle> _articleWidget;
  int _currentPage = 0;
  late int _totalPages;
  void _setWidgets() {
    Future.delayed(Duration.zero, () async {
      var filteredArticles = Provider.of<NewsArticleProvider>(context,listen: false);
      var articleWidget = filteredArticles.articles.map((article) => NewsArticle(article: article)).toList();
      setState(() {
        _articleWidget = articleWidget;
        _totalPages = articleWidget.length;
      });
      autoScroll();
    });
  }

  void autoScroll() {
    Future.delayed(const Duration(seconds: 5), () {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
      autoScroll(); // Recursive call for continuous scrolling
    });
}

  @override 
  void initState(){
    super.initState(); // Always call super.initState() first
    // _fetchDataAndPopulateList(); //intelligent 
    _setWidgets();
  }
  final PageController _controller = PageController(initialPage: 0);

  void onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(0),
        child: PageView(
          scrollDirection: Axis.vertical,
          onPageChanged: onPageChanged,
          controller: _controller,
          children: _articleWidget,
        ) 
      )
    );
  }
  }