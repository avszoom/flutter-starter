import 'package:flutter/material.dart';

class NewsArticleDesc extends StatelessWidget {
  final String desc;
  final double height;
  final double width;
  const NewsArticleDesc({super.key, required this.desc, required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: MediaQuery.of(context).size.width > 600 ? const EdgeInsets.only(top:20.0, left: 20.0,) : const EdgeInsets.only(top:15.0,left: 10,right:20, bottom:10),
        child: SizedBox(
        child: Text('$desc...',
        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize: 15),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
        )  ,
        )
    );
  }
}