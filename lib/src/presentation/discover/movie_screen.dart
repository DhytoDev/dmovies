import 'package:auto_route/auto_route.dart';
import 'package:dmovies/src/domain/model/movie.dart';
import 'package:dmovies/src/presentation/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import 'bloc.dart';

@RoutePage()
class MovieScreen extends StatefulWidget implements AutoRouteWrapper {
  const MovieScreen({
    super.key,
    required this.genreId,
  });

  final int genreId;

  @override
  State<MovieScreen> createState() => _MovieScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<MovieBloc>(),
      child: this,
    );
  }
}

class _MovieScreenState extends State<MovieScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context
        .read<MovieBloc>()
        .add(FetchMoviesEvent(page: 1, genreId: widget.genreId));
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DMovies'),
      ),
      body: BlocConsumer<MovieBloc, MovieListState>(
        buildWhen: (p, c) => p.movies.length != c.movies.length,
        builder: (context, state) {
          if (state.page == 0) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.extent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 8,
            childAspectRatio: 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            controller: scrollController
              ..addListener(
                () {
                  if (scrollController.offset >=
                      scrollController.position.maxScrollExtent) {

                    context.read<MovieBloc>().add(
                          FetchMoviesEvent(
                            page: state.page + 1,
                            genreId: widget.genreId,
                          ),
                        );
                  }
                },
              ),
            children: state.movies
                .map(
                  (e) => _MovieItemView(
                    key: ObjectKey(e),
                    movie: e,
                    onTap: () {
                      context.router.push(MovieDetailsRoute(movie: e));
                    },
                  ),
                )
                .toList(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}

class _MovieItemView extends StatelessWidget {
  const _MovieItemView({
    super.key,
    required this.movie,
    required this.onTap,
  });

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey[500],
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).colorScheme.onPrimary,
      type: MaterialType.card,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  // height: 75,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                softWrap: false,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
