import 'package:flutter/material.dart';

import 'views/news_screen.dart';

class NewsApp extends StatefulWidget {
  NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NewsScreen());
  }
}
