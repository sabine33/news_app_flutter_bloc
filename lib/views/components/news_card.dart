import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_rss_app/helpers/thumbnail_parser.dart';
import 'package:news_rss_app/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/constants.dart';

Widget NewsCard(NewsModel item) {
  return InkWell(
      onTap: () async {
        final url = item.link;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw "Could not open $url. Please make sure URL is valid.";
        }
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            FutureBuilder(
              future: ThumbnailParser.getThumbnailUrl(item.link),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return CachedNetworkImage(imageUrl: snapshot.data!);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              style: const TextStyle(fontSize: TITLE_FONT_SIZE),
            ),
          ]),
        ),
      ));
}
