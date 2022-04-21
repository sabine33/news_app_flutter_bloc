import '../../models/news_model.dart';

class NewsState {}

//For News
class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsModel> newsItems;
  NewsLoadedState(this.newsItems);
}

class NewsErrorState extends NewsState {
  final String message;
  NewsErrorState(this.message);
}
