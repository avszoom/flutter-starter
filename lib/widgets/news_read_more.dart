import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:html' as html;

class NewsReadMore extends StatelessWidget {
  final String newsUrl;
  final String title;
  const NewsReadMore({ Key? key , required this.newsUrl, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return 
      Container(
        margin: const EdgeInsets.only(left:0),
        child: SizedBox(
          child: TextButton(
          onPressed: () async {
            if (kIsWeb) {
              html.window.open(
                newsUrl,'new_tab');
            } else {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebViewPage(url: newsUrl,title: title,)),
                  );
          }
          },
          child: const Text('More',style: TextStyle(fontSize: 10,color: Color.fromRGBO(255, 0, 0, 1)),),
      )));
  }
}

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;
  WebViewPage({required this.url, required this.title});
  // late final _controller =  WebViewController()
  //     ..loadRequest(
  //       Uri.parse(url),
  //     );

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