import 'package:flutter/material.dart';
import 'package:samachar/views/home.dart';
import 'package:samachar/widgets/parent.dart';

Future<void> main() async {
  runApp(const Parent(child: HomeView()));
}

