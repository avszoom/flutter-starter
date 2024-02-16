import 'package:flutter/material.dart';

class NewsArticle extends StatelessWidget {
  final String article;
  const NewsArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return  Card(
            margin: const EdgeInsets.only(top:40,left:200,right:200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 240,
                    height: 240,
                    child: Image.asset('assets/images/sachin.jpeg'),
                  )
                )
                 ,  
                 Container(
                  padding: const EdgeInsets.only(top:25.0),
                 child: SizedBox(
                  width: 400,
                  height: 250,
                  child: Text(article,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  )  ,
                 )
                 )
              ],
            ),
          );
  }
}