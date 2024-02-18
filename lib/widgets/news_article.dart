import 'package:flutter/material.dart';
import 'package:starter/model/NewsArticleModel.dart';
import 'package:starter/widgets/news_article_desc.dart';
import 'package:starter/widgets/news_article_image.dart';

class NewsArticle extends StatelessWidget {
  final NewsArticleModel article;
  const NewsArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return  
      Stack(
        children: [
           Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(0, 0, 0, 0.8),
            child:
            Column(
              children: [
                NewsArticleImage(imageUrl: article.mediaUrl,height: MediaQuery.of(context).size.height*0.60 ,width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,), 
                Container(
                  margin: const EdgeInsets.only(left: 10,top:10),
                  height: MediaQuery.of(context).size.height*0.1,
                  child: 
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1 ,
                      child: Text(article.title.replaceAll("'", ""),
                      style:const TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1),fontSize: 17),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,))
                  ),
                  NewsArticleDesc(desc: article.shortDesc,height: MediaQuery.of(context).size.height*0.2,width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,)
                ],) 
          ),
          Positioned(
            top: 15,
            left: 15,
            child: Container(
            margin: const EdgeInsets.only(left:5),
            child: const Text('Samachar', style: TextStyle(
                fontWeight: FontWeight.bold, // To make the text bold
                fontSize: 30, // To increase the font size
                color: Color.fromRGBO(255,255,255,1)
            ),),
          )),
        ],
      );
   
  }
}