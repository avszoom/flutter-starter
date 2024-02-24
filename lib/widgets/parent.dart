import 'package:flutter/material.dart';

class Parent extends StatelessWidget {
  final Widget child;
  const Parent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      title: 'Samachar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'sans-serif',
      ),
      home: Container(
          margin: 
          MediaQuery.of(context).size.width > 600 
          ? const EdgeInsetsDirectional.only(top: 100,start: 400,end: 200)
          : 
          const EdgeInsetsDirectional.all(0.0),
          child: SizedBox(child: child),
      ),
    );
  }
}