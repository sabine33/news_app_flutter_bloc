import 'package:bloc/bloc.dart';

import '../../helpers/constants.dart';
import '../../helpers/thumbnail_parser.dart';
import 'thumbnail_events.dart';
import 'thumbnail_states.dart';

class ThumbnailBloc extends Bloc<ThumbnailEvents, ThumbnailState> {
  ThumbnailBloc() : super(ThumbnailLoadingState()) {
    on<LoadThumbnailEvent>((LoadThumbnailEvent event, emit) =>
        _onLoadThumbnail(event, state, emit));
  }
  void _onLoadThumbnail(LoadThumbnailEvent event, state, emit) async {
    try {
      emit(ThumbnailLoadingState());

      final thumbnailURL =
          await ThumbnailParser.getThumbnailUrl(event.url) ?? DEFAULT_THUMBNAIL;
      emit(ThumbnailLoadedState(thumbnailURL));
    } catch (ex) {
      emit(ThumbnailErrorState("Error loading thumbnail"));
    }
  }
}
