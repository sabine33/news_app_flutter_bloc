class ThumbnailEvents {}

class LoadThumbnailEvent extends ThumbnailEvents {
  String url;
  LoadThumbnailEvent(this.url);
}
