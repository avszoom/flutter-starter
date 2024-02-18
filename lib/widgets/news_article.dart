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
            child:
            Stack(
              children: [
                NewsArticleImage(imageUrl: article.mediaUrl,height: MediaQuery.of(context).size.height ,width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,), 
                Positioned(
                  top: MediaQuery.of(context).size.height*0.75,
                  left: 0,
                  right: 10,
                  child: Column(children: [
                    Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(article.title.replaceAll("'", ""),
                      style:const TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1),fontSize: 20),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,)),
                    NewsArticleDesc(desc: article.shortDesc,height: MediaQuery.of(context).size.height*0.3,width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,)
                ],) 
                ) 
                 ],
            )
          );
  }
}