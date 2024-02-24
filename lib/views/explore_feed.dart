import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/model/NewsArticleProvider.dart';
import 'package:samachar/widgets/main_feed_news_article.dart';
import 'package:samachar/widgets/news_article_image.dart';

class ExploreFeed extends StatefulWidget {
  const ExploreFeed({super.key});

  @override
  State<ExploreFeed> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExploreFeed> {
  late List<NewsArticleModel> _articles = [];

  Future<void> _fetchDataAndPopulateList() async {
    Future.delayed(Duration.zero, () async {
      var articles = Provider.of<NewsArticleProvider>(context, listen: false);
      await articles.fetchArticles();
      setState(() {
        _articles = articles.articles;
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
    return GridView.count(
          crossAxisCount: 3,
          children: _articles.map((article) => Center(child: NewsArticleImage(imageUrl: article.mediaUrl, 
          height: MediaQuery.of(context).size.height*0.28, width: MediaQuery.of(context).size.width,), )).toList()
          // .forEach((article) => const Center(
          //     child: Text('Item'),
          //   )
          // ),
    );
  }
}