import 'package:flutter/material.dart';

class NewsArticle extends StatelessWidget {
  final String article;
  const NewsArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return  Text(article, style: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20.0
    ),);
  }
}