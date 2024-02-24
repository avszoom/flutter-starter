import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        child: SizedBox(
          child: TextButton(
          onPressed: () async {
            if (kIsWeb) {
              await launchUrl(Uri.parse(newsUrl));
            } else {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebViewPage(url: newsUrl,title: title,)),
                  );
          }},
          child: const Text('More',style: TextStyle(fontSize: 12,color: Color.fromRGBO(255, 0, 0, 1)),),
        )
      ));
  }
}

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;
  WebViewPage({required this.url, required this.title});
  late final _controller =  WebViewController()
      ..loadRequest(
        Uri.parse(url),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}