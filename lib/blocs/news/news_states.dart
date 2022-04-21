import '../../models/news_model.dart';

class NewsState {}

class LoadingState extends NewsState {}

class LoadedState extends NewsState {
  final List<NewsModel> newsItems;
  LoadedState(this.newsItems);
}
