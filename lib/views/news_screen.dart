import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rss_app/blocs/news/news_bloc.dart';
import 'package:news_rss_app/blocs/news/news_events.dart';

import '../blocs/news/news_states.dart';
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
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LoadedState) {
          return ListView.builder(
              itemCount: state.newsItems.length,
              itemBuilder: (context, index) {
                var item = state.newsItems.elementAt(index);
                return Padding(
                    padding: const EdgeInsets.all(8.0), child: NewsCard(item));
              });
        }
        if (state is LoadingErrorState) {
          return const Center(child: Text("Error Loading news"));
        }
        return Container();
      },
    );
  }
}
