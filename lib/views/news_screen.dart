import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rss_app/blocs/news/news_bloc.dart';
import 'package:news_rss_app/blocs/news/news_events.dart';
import 'package:news_rss_app/blocs/thumbnail/thumbnail_states.dart';
import 'package:news_rss_app/views/news_detail.dart';

import '../blocs/news/news_states.dart';
import '../blocs/thumbnail/thumbnail_bloc.dart';
import '../blocs/thumbnail/thumbnail_events.dart';
import '../helpers/constants.dart';
import 'components/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(LoadNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(APP_NAME),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.read<NewsBloc>().add(LoadNewsEvent());
              print("NEWS LOADING");
            },
          )
        ],
      ),
      body: Container(
        color: BG_COLOR,
        child: BlocConsumer<NewsBloc, NewsState>(
          listenWhen: (context, state) {
            return state is NewsLoadedState ||
                state is ThumbnailLoadedState ||
                state is NewsClickedState ||
                state is NewsLoadingState;
          },
          listener: (context, state) {
            if (state is NewsClickedState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => NewsDetailScreen(news: state.news)));
            }
          },
          buildWhen: (context, state) {
            return state is NewsLoadedState || state is NewsLoadingState;
          },
          builder: (BuildContext context, state) {
            if (state is NewsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewsLoadedState) {
              return ListView.builder(
                  cacheExtent: 9999,
                  itemCount: state.newsItems.length,
                  itemBuilder: (context, index) {
                    var item = state.newsItems.elementAt(index);
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocProvider(
                            create: (blocContext) => ThumbnailBloc()
                              ..add(LoadThumbnailEvent(item.link)),
                            child: NewsCard(context.read(), item)));
                  });
            }
            if (state is NewsErrorState) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
