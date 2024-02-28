import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui_state.dart';
import '../../di/injection.dart';
import '../../domain/model/genre.dart';
import '../route/app_router.dart';
import 'bloc/genre_bloc.dart';

@RoutePage()
class GenreScreen extends StatelessWidget implements AutoRouteWrapper {
  const GenreScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<MovieGenreCubit>()..fetchMovieGenres(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieGenreCubit, UiState<List<Genre>>>(
      builder: (context, state) {
        final body = switch (state) {
          InitialState() => const SizedBox.shrink(),
          LoadingState() => const Center(child: CircularProgressIndicator()),
          ErrorState() => Text(state.message.toString()),
          SuccessState() => _GenreListView(
              key: const Key('GenreListView'),
              genres: state.data!,
            )
        };

        return Scaffold(
          appBar: AppBar(),
          body: body,
        );
      },
    );
  }
}

class _GenreListView extends StatelessWidget {
  const _GenreListView({
    super.key,
    required this.genres,
  });

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: genres
          .map(
            (genre) => _GenreItemView(
              key: ValueKey(genre.id),
              genre: genre,
              onTap: () {
                context.router.push(MovieRoute(genreId: genre.id));
              },
            ),
          )
          .toList(),
    );
  }
}

class _GenreItemView extends StatelessWidget {
  const _GenreItemView({
    super.key,
    required this.genre,
    required this.onTap,
  });

  final Genre genre;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Center(
          child: Text(genre.name),
        ),
      ),
    );
  }
}
