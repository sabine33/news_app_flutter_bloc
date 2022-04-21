import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rss_app/blocs/news_bloc.dart';
import 'package:news_rss_app/blocs/news_events.dart';

import '../blocs/news_states.dart';

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
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(item.title),
                    ),
                  ),
                );
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
