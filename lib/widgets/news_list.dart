import 'package:flutter/material.dart';
import 'package:starter/apis/NewsArticleApi.dart';
import 'package:starter/widgets/news_article.dart';

class NewsList extends StatefulWidget {
  const NewsList({ Key? key }) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  
  late List<NewsArticle> _articleWidget;
  bool _isLoading = true;

  Future<void> _fetchDataAndPopulateList() async {
    var articles = await NewsArticeApi().fetchNews();
    var articleWidget = articles.sublist(0,10).map((article) => NewsArticle(article: article)).toList();
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
    return _isLoading? const Center(child: CircularProgressIndicator()) :Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text('Trending News', style: TextStyle(
                fontWeight: FontWeight.bold, // To make the text bold
                fontSize: 30, // To increase the font size
            ),),
                    ),
          Expanded(child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _articleWidget,
          ),)
          ),
        ],
      )
    );
  }
  }