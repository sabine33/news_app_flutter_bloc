import 'package:dio/dio.dart';
import 'package:news_rss_app/helpers/constants.dart';
import 'package:webfeed/webfeed.dart';

class NewsApi {
  Future<List<AtomItem>> getNewsData() async {
    final dio = Dio();
    dio.options.headers = {'content-Type': 'text/xml'};

    Response response = await dio.get(
      NEWS_FEED,
    );

    var xmlString = response.data.toString();
    var rssFeed = AtomFeed.parse(xmlString);
    return rssFeed.items ?? [];
  }
}
