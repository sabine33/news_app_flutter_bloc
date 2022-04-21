class ThumbnailState {}

class ThumbnailLoadingState extends ThumbnailState {}

class ThumbnailLoadedState extends ThumbnailState {
  final String url;
  ThumbnailLoadedState(this.url);
}

class ThumbnailErrorState extends ThumbnailState {
  final String message;
  ThumbnailErrorState(this.message);
}
