import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/model/NewsArticleProvider.dart';
import 'package:samachar/widgets/main_feed_news_article.dart';
import 'package:samachar/widgets/news_article.dart';
import 'package:samachar/widgets/news_article_desc.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  State<MainFeed> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainFeed> {
  late List<MainFeedNewsArticle> _articleWidget = [];
  bool _isLoading = true;

  Future<void> _fetchDataAndPopulateList() async {
    Future.delayed(Duration.zero, () async {
      var articles = Provider.of<NewsArticleProvider>(context, listen: false);
      await articles.fetchArticles();
      var articleWidget = articles.articles.map((article) => MainFeedNewsArticle(article: article)).toList();
      print(articleWidget.length);
      setState(() {
        _isLoading= false;
        _articleWidget = articleWidget;
      });
    });
  }

  @override 
  void initState(){
    super.initState(); // Always call super.initState() first
    _fetchDataAndPopulateList(); //intelligent 
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading? Scaffold(
        backgroundColor:Colors.black, 
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
      ):SingleChildScrollView(
            
            child: Column(
              children: _articleWidget,
            ),
      );
  }
}