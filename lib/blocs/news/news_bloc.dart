import 'package:bloc/bloc.dart';

import '../../repository/news_repository.dart';
import 'news_events.dart';
import 'news_states.dart';

class LoadingErrorState extends NewsState {}

class NewsBloc extends Bloc<EuphoriaEvents, NewsState> {
  final NewsRepository repository;

  NewsBloc(this.repository) : super(LoadingState()) {
    on<LoadNewsEvent>(_onLoadNews);
  }
  void _onLoadNews(state, emit) async {
    emit(LoadingState());
    final newsItems = await repository.getNewsFromRSS();
    emit(LoadedState(newsItems));
  }
}
