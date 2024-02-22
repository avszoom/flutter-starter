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
      // print(e.toString());
    }
    var filteredArticles = filterConsecutiveRepeatedArticles(articles);
    // filteredArticles.shuffle(Random());
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
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(0, 0, 0, 1), // Match scaffold bg color
        height: 60,
        child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap:() {
                    {
                      controller.animateToPage(
                        0, // The index of the page to animate to
                        duration: const Duration(milliseconds: 500), // The duration of the animation
                        curve: Curves.ease, // The curve of the animation
                      );
                  }},
                  child: const SizedBox(
                      child: Icon(
                        Icons.home,
                        color: Colors.blue, // Optionally, specify the icon's color
                        size: 30, // Optionally, specify the icon's size
                      ),
                    ),
                    ),
              ),
            ],
          ),
      ),
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