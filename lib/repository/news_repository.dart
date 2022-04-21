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
        title: e.title!,
        categories: e.categories ?? [],
        content: e.content ?? '',
        enclosure: {},
        guid: '',
        link: e.links!.first.href ?? '',
        thumbnail: ''));
    return newsList.toList();
  }
}
