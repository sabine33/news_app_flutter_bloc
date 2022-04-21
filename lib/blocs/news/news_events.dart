import 'package:news_rss_app/models/news_model.dart';

class NewsEvents {}

class LoadNewsEvent extends NewsEvents {}

class NewsOpenedEvent extends NewsEvents {
  NewsModel news;
  NewsOpenedEvent(this.news);
}
