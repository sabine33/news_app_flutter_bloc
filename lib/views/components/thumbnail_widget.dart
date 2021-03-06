import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rss_app/helpers/constants.dart';

import '../../blocs/thumbnail/thumbnail_bloc.dart';
import '../../blocs/thumbnail/thumbnail_states.dart';

class ThumbnailWidget extends StatelessWidget {
  final String url;

  const ThumbnailWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThumbnailBloc, ThumbnailState>(
      builder: (BuildContext context, state) {
        if (state is ThumbnailLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ThumbnailLoadedState) {
          return CachedNetworkImage(imageUrl: state.url);
        }
        if (state is ThumbnailErrorState) {
          return CachedNetworkImage(imageUrl: DEFAULT_THUMBNAIL);
        }
        return Container();
      },
    );
  }
}
