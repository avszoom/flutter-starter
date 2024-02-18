import 'package:flutter/material.dart';
import 'package:starter/views/home.dart';
import 'package:starter/widgets/parent.dart';

Future<void> main() async {
  runApp(const Parent(child: HomeView()));
}

