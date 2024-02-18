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
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0), // Adjust the border radius as needed
              side: const BorderSide(color: Colors.grey, width: 1.0), // Optional: add a border
            ),
            margin: const EdgeInsets.all(0),
            color: const Color.fromRGBO(0, 0, 0, 0.8),
            child:
            Column(
              children: [
                NewsArticleImage(imageUrl: article.mediaUrl,height: MediaQuery.of(context).size.height*0.65 ,width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,), 
                Column(children: [
                    Container(
                    margin: const EdgeInsets.only(left: 10,top:10),
                    child: 
                    SizedBox(
                      // height: MediaQuery.of(context).size.height*0.1 ,
                      child: Text(article.title.replaceAll("'", ""),
                      style:const TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1),fontSize: 15),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,))),
                    NewsArticleDesc(desc: article.shortDesc,height: MediaQuery.of(context).size.height*0.25,width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,)
                ],) 
                 ],
            )
          );
  }
}