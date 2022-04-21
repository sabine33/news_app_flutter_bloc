import 'package:bloc/bloc.dart';

import '../../repository/news_repository.dart';
import 'news_events.dart';
import 'news_states.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  final NewsRepository repository;

  NewsBloc(this.repository) : super(NewsLoadingState()) {
    on<LoadNewsEvent>(_onLoadNews);
  }
  void _onLoadNews(state, emit) async {
    emit(NewsLoadingState());
    final newsItems = await repository.getNewsFromRSS();
    emit(NewsLoadedState(newsItems));
  }
}
