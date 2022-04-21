import 'package:metadata_fetch/metadata_fetch.dart';

class ThumbnailParser {
  static Future<String?> getThumbnailUrl(String url) async {
    var data = await MetadataFetch.extract(url);
    print(data?.toJson());
    return data?.image;
    //TODO THUMBNAIL NOT LOADING
  }
}
