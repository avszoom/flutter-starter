import 'package:flutter/material.dart';

class Parent extends StatelessWidget {
  final Widget child;
  const Parent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: Container(
          margin: const EdgeInsetsDirectional.only(top: 100,start: 200,end: 200, bottom: 100),
          child: Center(child: child),
      ),
    );
  }
}