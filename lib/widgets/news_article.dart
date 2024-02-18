import 'package:flutter/material.dart';
import 'package:starter/model/NewsArticleModel.dart';
import 'package:starter/widgets/news_article_desc.dart';
import 'package:starter/widgets/news_article_image.dart';

class NewsArticle extends StatelessWidget {
  final NewsArticleModel article;
  const NewsArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return  Card(
            // margin: const EdgeInsets.only(top:40,left:200,right:200),
            color: const Color.fromRGBO(0, 0, 0, 0.8),
            child: MediaQuery.of(context).size.width > 600 ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top:20.0),
                  child: Text(article.title,
                    style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromRGBO(255, 255, 255, 1)),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3),
                ),
                Row(
                  children: [
                    NewsArticleImage(imageUrl: article.mediaUrl,height: 200,width: 300,),
                    const SizedBox(width: 20.0,),
                    NewsArticleDesc(desc: article.shortDesc,height: 100,width: 300,)
                  ],
                ),
              ],
            )
            : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NewsArticleImage(imageUrl: article.mediaUrl,height: 200,width: 350,),  
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(article.title.replaceAll("'", ""),
                    style:const TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1)),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,)),
                NewsArticleDesc(desc: article.shortDesc,height: 100,width: 350,)
                 ],
            )
          );
  }
}