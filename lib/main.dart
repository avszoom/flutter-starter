import 'package:flutter/material.dart';
import 'package:samachar/model/NewsArticleProvider.dart';
import 'package:samachar/views/home.dart';
import 'package:samachar/widgets/parent.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsArticleProvider(),
      child: const Parent(
          child: HomeView()
        )),
    );
}

