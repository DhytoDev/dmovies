import 'package:auto_route/auto_route.dart';
import 'package:dmovies/src/di/injection.dart';
import 'package:dmovies/src/domain/model/movie.dart';
import 'package:dmovies/src/presentation/discover/bloc.dart';
import 'package:dmovies/src/presentation/discover/bloc/movie_event.dart';
import 'package:dmovies/src/presentation/discover/widgets/review_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui_state.dart';
import 'bloc/movie_details_bloc.dart';

@RoutePage()
class ReviewListScreen extends StatefulWidget implements AutoRouteWrapper {
  const ReviewListScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsBloc>()
        ..add(GetMovieReviewsEvent(movie.id, page: 1)),
      child: this,
    );
  }
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context
        .read<MovieDetailsBloc>()
        .add(GetMovieReviewsEvent(widget.movie.id, page: 1));
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
        title: Text(widget.movie.title),
      ),
      body: BlocBuilder<MovieDetailsBloc, UiState<MovieDetails?>>(
        builder: (context, state) {
          final textTheme = Theme.of(context).textTheme;

          final reviews = state.data?.reviews ?? List.empty();

          if (state.data?.page == 0) return const SizedBox.shrink();

          return ListView.builder(
            controller: scrollController
              ..addListener(() {
                if (scrollController.offset >=
                    scrollController.position.maxScrollExtent) {
                  if (state.data != null) {
                    context.read<MovieDetailsBloc>().add(
                          GetMovieReviewsEvent(
                            widget.movie.id,
                            page: state.data!.page + 1,
                          ),
                        );
                  }
                }
              }),
            itemCount: reviews.length,
            itemBuilder: (context, i) {
              return ReviewTile(review: reviews[i]);
            },
          );
        },
      ),
    );
  }
}
