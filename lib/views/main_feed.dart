import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/model/NewsArticleProvider.dart';
import 'package:samachar/widgets/explore_overlay_widget.dart';
import 'package:samachar/widgets/main_feed_news_article.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  State<MainFeed> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainFeed> {
  late List<GestureDetector> _articleWidget = [];
  bool _isLoading = true;
  var currentArticle;

  Future<void> _fetchDataAndPopulateList() async {
    Future.delayed(Duration.zero, () async {
      var articles = Provider.of<NewsArticleProvider>(context, listen: false);
      await articles.fetchArticles();
      var articleWidget = articles.articles.map((article) => GestureDetector(
          onTap: () => {
                    currentArticle = article,
                    _showCenterSheet(context,article)
                  },
          child: MainFeedNewsArticle(article: article))).toList();
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

  void _showCenterSheet(BuildContext context, NewsArticleModel article) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // Rounded corners
          backgroundColor: Colors.black,
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10), // Margin from screen edges
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use minimum space necessary
              children: <Widget>[
                ExploreOverlayWidget(article: article,imageHeight: 0.25,fontsize: 15,titleLines: 2,articleHeight: 0.3,descLines: 15,),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
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