import 'package:bloc/bloc.dart';
import 'package:news_rss_app/blocs/news/thumbnail_events.dart';
import 'package:news_rss_app/blocs/news/thumbnail_states.dart';
import 'package:news_rss_app/helpers/constants.dart';
import 'package:news_rss_app/helpers/thumbnail_parser.dart';

class ThumbnailBloc extends Bloc<ThumbnailEvents, ThumbnailState> {
  ThumbnailBloc() : super(ThumbnailLoadingState()) {
    on<LoadThumbnailEvent>((LoadThumbnailEvent event, emit) =>
        _onLoadThumbnail(event, state, emit));
  }
  void _onLoadThumbnail(LoadThumbnailEvent event, state, emit) async {
    emit(ThumbnailLoadingState());
    final thumbnailURL =
        await ThumbnailParser.getThumbnailUrl(event.url) ?? DEFAULT_THUMBNAIL;
    emit(ThumbnailLoadedState(thumbnailURL));
  }
}
