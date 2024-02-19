import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsReadMore extends StatelessWidget {
  final String newsUrl;
  final String title;
  const NewsReadMore({ Key? key , required this.newsUrl, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return 
      Container(
        margin: const EdgeInsets.only(top:5,left:0),
        child: ElevatedButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebViewPage(url: newsUrl,title: title,)),
                );
        },
        child: const Text('Read More'),
      )
      );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;
  WebViewPage({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}