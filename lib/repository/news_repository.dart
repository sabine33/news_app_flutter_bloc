import 'package:html/parser.dart';

import '../api/news_api.dart';
import '../models/news_model.dart';

class NewsRepository {
  NewsApi api;
  NewsRepository({required this.api});

  Future<List<NewsModel>> getNewsFromRSS() async {
    var newsStuffs = await NewsApi().getNewsData();

    var newsList = newsStuffs.map((e) => NewsModel(
        author: '',
        description: e.summary ?? '',
        pubDate: e.published ?? '',
        //sanitize title
        title: parseFragment(e.title).text!,
        categories: e.categories ?? [],
        content: e.content ?? '',
        enclosure: {},
        guid: '',
        link: getCleanUrl(e.links!.first.href!), //!.first.href ?? '',
        thumbnail: ''));
    return newsList.toList();
  }

  getCleanUrl(String url) {
    print(url);
    var uri = Uri.parse(url);
    var urlParam = uri.queryParameters['url'];
    return urlParam;
  }
}
