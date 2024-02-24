import 'package:flutter/material.dart';
import 'package:samachar/model/NewsArticleModel.dart';
import 'package:samachar/widgets/news_article_image.dart';
import 'package:samachar/widgets/news_read_more.dart';

class MainFeedNewsArticle extends StatelessWidget {
  final NewsArticleModel article;
  const MainFeedNewsArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(0, 0, 0, 0.8),
            margin: const EdgeInsets.all(3),
            child:
            Column(
              children: [
                NewsArticleImage(imageUrl: article.mediaUrl, height: MediaQuery.of(context).size.height*0.2, width: MediaQuery.of(context).size.width,), 
                Container(
                  margin: const EdgeInsets.only(left: 10,top:10),
                  child: 
                    SizedBox(
                      child: Text(article.title.replaceAll("'", ""),
                      style:const TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1),fontSize: 15),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,))
                  ),
                  Container(
                    height: 30,
                    child: NewsReadMore(newsUrl: article.articleUrl,title: article.title,),
                  )
                ],
          ));
  }
}