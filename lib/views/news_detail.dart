import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;
  const NewsDetailScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(news.title),
      ),
      body: WebView(initialUrl: this.news.link),
    );
  }
}
