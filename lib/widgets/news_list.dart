import 'package:flutter/material.dart';
import 'package:starter/widgets/news_article.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.0),
          Center(
            child: Text('Trending News', style: TextStyle(
                fontWeight: FontWeight.bold, // To make the text bold
                fontSize: 30, // To increase the font size
            ),),
          ),
          SizedBox(height: 50.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewsArticle(article: "Article 1"),
              NewsArticle(article: "Article 2"),
            ],
          )
        ],
      ),
    );
  }
}