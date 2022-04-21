import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rss_app/blocs/news/news_bloc.dart';
import 'package:news_rss_app/blocs/news/thumbnail_bloc.dart';
import 'package:news_rss_app/repository/news_repository.dart';

import 'api/news_api.dart';
import 'api/users_api.dart';
import 'blocs/users/users_bloc.dart';
import 'news_app.dart';
import 'repository/user_repository.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
            create: (context) => NewsBloc(NewsRepository(api: NewsApi()))),
        BlocProvider(
            create: (context) =>
                UserBloc(userRepository: UserRepository(userApi: UserApi()))),
        BlocProvider(create: (context) => ThumbnailBloc())
      ],
      child: NewsApp(),
    ),
  ));
}
