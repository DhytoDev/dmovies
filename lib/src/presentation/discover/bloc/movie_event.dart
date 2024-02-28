sealed class MovieEvent {}

class MovieDetailsEvent extends MovieEvent {
  final int movieId;

  MovieDetailsEvent(this.movieId);
}

class FetchMoviesEvent extends MovieEvent {
  final int page;
  final int genreId;

  FetchMoviesEvent({
    this.page = 0,
    this.genreId = 0,
  });
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  GetMovieDetailsEvent(super.movieId);
}

class GetMovieVideosEvent extends MovieDetailsEvent {
  GetMovieVideosEvent(super.movieId);
}

class GetMovieReviewsEvent extends MovieDetailsEvent {
  GetMovieReviewsEvent(super.movieId, {required this.page});

  final int page;
}
