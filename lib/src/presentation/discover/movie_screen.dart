import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import 'bloc.dart';

@RoutePage()
class MovieScreen extends StatefulWidget implements AutoRouteWrapper {
  const MovieScreen({super.key, required this.genreId});

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
    debugPrint(widget.genreId.toString());
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieBloc, MovieListState>(
        buildWhen: (p, c) => p.movies.length != c.movies.length,
        builder: (context, state) {
          debugPrint(state.totalPages.toString());

          if (state.page == 0) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            controller: scrollController
              ..addListener(
                () {
                  if (scrollController.offset >=
                      scrollController.position.maxScrollExtent) {
                    debugPrint("loadMore");

                    context.read<MovieBloc>().add(
                          FetchMoviesEvent(
                            page: state.page + 1,
                            genreId: widget.genreId,
                          ),
                        );
                  }
                },
              ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: state.movies.length,
            itemBuilder: (context, i) {
              final movie = state.movies[i];

              return Card(
                child: Text(movie.title),
              );
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
