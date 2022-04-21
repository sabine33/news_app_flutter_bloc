import 'package:flutter/material.dart';
import 'package:news_rss_app/blocs/news/news_bloc.dart';
import 'package:news_rss_app/blocs/news/news_events.dart';
import 'package:news_rss_app/models/news_model.dart';
import 'package:news_rss_app/views/components/thumbnail_widget.dart';

import '../../helpers/constants.dart';

Widget NewsCard(NewsBloc bloc, NewsModel item) {
  return InkWell(
      onTap: () async {
        bloc.add(NewsOpenedEvent(item));
        // final url = item.link;

        // if (await canLaunch(url)) {
        //   await launch(url);
        // } else {
        //   throw "Could not open $url. Please make sure URL is valid.";
        // }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ThumbnailWidget(url: item.link)),
            SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              style: const TextStyle(
                  fontSize: TITLE_FONT_SIZE, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ));
}
