import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/model/NewsArticleProvider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:samachar/widgets/explore_overlay_widget.dart';
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
  var showOverlayWidget = false;
  var currentArticle;

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
                ExploreOverlayWidget(article: article),
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
    return 
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: _articles.map((article) => StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: Random().nextInt(3) >= 1.5 ? 2 : 1,
                child: GestureDetector(
                  onTap: () => {
                    currentArticle = article,
                    _showCenterSheet(context,article)
                  },
                  child: NewsArticleImage(imageUrl: article.mediaUrl, 
                    height: MediaQuery.of(context).size.height*0.28, 
                    width: MediaQuery.of(context).size.width,),
                  ))).toList(),
          ));
  }
}