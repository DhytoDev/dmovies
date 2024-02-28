import 'package:auto_route/auto_route.dart';
import 'package:dmovies/src/presentation/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/ui_state.dart';
import '../../di/injection.dart';
import '../../domain/model/movie.dart';
import 'bloc.dart';
import 'bloc/movie_details_bloc.dart';
import 'widgets/review_section.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget implements AutoRouteWrapper {
  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(movie.id))
        ..add(GetMovieVideosEvent(movie.id)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, UiState<MovieDetails?>>(
      builder: (context, state) {
        final movieDetails = state.data;

        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              CollapsingToolbar(
                key: ValueKey(movie.id),
                title: movie.title,
                backdrop: movie.backdropPath,
              ),
              SliverToBoxAdapter(
                child: _DescriptionSection(movie: movie),
              ),
              const SliverToBoxAdapter(
                child: VideoListView(),
              ),
              BlocProvider.value(
                value: context.read<MovieDetailsBloc>(),
                child: SliverToBoxAdapter(
                  child: ReviewSection(
                    movieId: movie.id,
                    onSeeMoreTap: () {
                      context.router.push(
                        ReviewListRoute(movie: movieDetails?.movie ?? movie),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Story'),
          subtitle: Text(movie.overview),
        )
      ],
    );
  }
}

class CollapsingToolbar extends StatelessWidget {
  final double _appBarHeight = 256.0;
  final String title, backdrop;

  const CollapsingToolbar({
    super.key,
    required this.title,
    required this.backdrop,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _appBarHeight,
      pinned: true,
      floating: false,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {},
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: title,
              child: Image.network(
                backdrop,
                fit: BoxFit.cover,
                height: _appBarHeight,
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, -0.4),
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoListView extends StatelessWidget {
  const VideoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, UiState<MovieDetails?>>(
      builder: (context, state) {
        final videos = state.data?.videos ?? List.empty();

        if (videos.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: videos
                .map(
                  (e) => Container(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Material(
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () async {
                          final uri = Uri.parse(
                              'https://www.youtube.com/watch?v=${e.key}');

                          if (!await launchUrl(uri)) {
                            throw Exception('Could not launch $uri');
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.network(
                              e.getImageVideoUrl(),
                              fit: BoxFit.fill,
                              width: 200.0,
                              height: 150.0,
                            ),
                            Center(
                              child: Icon(
                                Icons.play_circle_outline,
                                size: 50.0,
                                color: Colors.grey[300],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
