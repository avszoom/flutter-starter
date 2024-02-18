import 'package:flutter/material.dart';

class NewsArticleImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const NewsArticleImage({super.key,required this.imageUrl, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: width,
          height: height,
          child: Image.network(imageUrl,fit: BoxFit.cover,width: 300, height: 300,),
        )
      )
      ;
  }
}