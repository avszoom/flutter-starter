import 'package:flutter/material.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/widgets/news_article_desc.dart';
import 'package:samachar/widgets/news_article_image.dart';
import 'package:samachar/widgets/news_read_more.dart';

class ExploreOverlayWidget extends StatelessWidget {
  final NewsArticleModel article;
  double imageHeight;
  double fontsize;
  int titleLines;
  double articleHeight;
  int descLines;
  ExploreOverlayWidget({super.key, required this.article,this.imageHeight=0.3,this.fontsize=15,this.titleLines=2,
    this.articleHeight=0.2,this.descLines=10});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              children: [
                NewsArticleImage(imageUrl: article.mediaUrl,height: MediaQuery.of(context).size.height*imageHeight ,width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,), 
                Container(
                  margin: const EdgeInsets.only(left: 10,top:10),
                  child: 
                    SizedBox(
                      child: Text(article.title.replaceAll("'", ""),
                      style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromRGBO(255, 255, 255, 1),fontSize: fontsize),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: titleLines,))
                  ),
                  NewsArticleDesc(desc: article.shortDesc,height: MediaQuery.of(context).size.height*articleHeight,
                    width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,descLines: descLines,),
                  NewsReadMore(newsUrl: article.articleUrl,title: article.title,),
                ],) 
      // Text(article.shortDesc,style:const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
    );
  }
}