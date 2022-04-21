import 'package:metadata_fetch/metadata_fetch.dart';

class ThumbnailParser {
  static Future<String> getThumbnailUrl(String url) async {
    var data = await MetadataFetch.extract(url);
    return data?.image ??
        'https://www.messagetech.com/wp-content/themes/ml_mti/images/no-image.jpg';
  }
}
