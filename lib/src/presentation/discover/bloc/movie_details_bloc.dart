import 'dart:async';

import 'package:dmovies/src/core/ui_state.dart';
import 'package:dmovies/src/domain/model/movie.dart';
import 'package:dmovies/src/domain/repositories/movie_repository.dart';
import 'package:dmovies/src/presentation/discover/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/review.dart';
import '../../../domain/model/video.dart';

class MovieDetails extends Equatable {
  final Movie movie;
  final List<Video> videos;
  final int page;
  final List<Review> reviews;
  final int totalPages;

  const MovieDetails({
    this.movie = const Movie(),
    this.videos = const [],
    this.page = 0,
    this.reviews = const [],
    this.totalPages = 0,
  });

  MovieDetails? copyWith({
    Movie? movie,
    List<Video>? videos,
    int? page,
    List<Review>? reviews,
    int? totalPages,
  }) {
    return MovieDetails(
      movie: movie ?? this.movie,
      videos: videos ?? this.videos,
      page: page ?? this.page,
      reviews: reviews ?? this.reviews,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object?> get props => [movie, videos, reviews];
}

@injectable
class MovieDetailsBloc extends Bloc<MovieEvent, UiState<MovieDetails>> {
  MovieDetailsBloc(this._movieRepository) : super(InitialState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieVideosEvent>(_getMovieVideos);
    on<GetMovieReviewsEvent>(_getMovieReviews);
  }

  final IMovieRepository _movieRepository;

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<UiState<MovieDetails>> emit,
  ) async {
    emit(LoadingState());

    final movie = await _movieRepository.getMovieDetails(event.movieId);

    return movie.fold(
      (l) {},
      (r) {
        emit(SuccessState(MovieDetails(movie: r)));
      },
    );
  }

  FutureOr<void> _getMovieVideos(
      GetMovieVideosEvent event, Emitter<UiState<MovieDetails>> emit) async {
    final videos = await _movieRepository.getMovieVideos(event.movieId);

    return videos.fold(
      (l) {},
      (r) {
        if (state.data != null) {
          final movieDetails =
              state.data?.copyWith(videos: r) ?? const MovieDetails();

          emit(SuccessState(movieDetails));
        }
      },
    );
  }

  FutureOr<void> _getMovieReviews(
      GetMovieReviewsEvent event, Emitter<UiState<MovieDetails>> emit) async {
    if (event.page < 1 || event.page > 500) return;

    if (event.page == state.data?.totalPages) return;

    final reviews =
        await _movieRepository.getMovieReviews(event.movieId, page: event.page);

    return reviews.fold(
      (l) {
        emit(ErrorState(l.status.toString()));
      },
      (r) {
        final movieDetails = state.data?.copyWith(
              page: r.page,
              reviews: List.of(state.data!.reviews)..addAll(r.data),
            ) ??
            const MovieDetails();

        emit(SuccessState(movieDetails));
      },
    );
  }
}
