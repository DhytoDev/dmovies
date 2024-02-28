import 'package:dmovies/src/presentation/discover/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/ui_state.dart';
import '../../../domain/model/review.dart';
import '../bloc/movie_details_bloc.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({
    super.key,
    required this.movieId,
    required this.onSeeMoreTap,
  });

  final int movieId;
  final VoidCallback onSeeMoreTap;

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context
        .read<MovieDetailsBloc>()
        .add(GetMovieReviewsEvent(widget.movieId, page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, UiState<MovieDetails?>>(
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;

        final reviews = state.data?.reviews ?? List.empty();

        if (reviews.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Reviews',
                  style: textTheme.titleMedium,
                ),
                trailing: InkWell(
                  onTap: widget.onSeeMoreTap,
                  child: Text('See more'),
                ),
              ),
              ...reviews.take(2).map(
                (e) {
                  return ReviewTile(review: e);
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.author, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(review.content),
          ],
        ),
      ),
    );
  }
}
