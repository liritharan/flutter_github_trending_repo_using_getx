import 'package:flutter/material.dart';
import 'package:flutter_github_trending_repo/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Github',
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(
            primarySwatch: Colors.blueGrey
        ),
        home: const HomePage());
  }
}
