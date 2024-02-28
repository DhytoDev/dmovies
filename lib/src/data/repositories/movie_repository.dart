import 'package:dartz/dartz.dart';
import 'package:dmovies/src/domain/model/review.dart';
import 'package:dmovies/src/domain/model/video.dart';
import 'package:injectable/injectable.dart';

import '../../core/exceptions.dart';
import '../../domain/model/movie.dart';
import '../../domain/model/movie_list.dart';
import '../../domain/repositories/movie_repository.dart';
import '../remote/services/movie_service.dart';

@LazySingleton(as: IMovieRepository)
final class MovieRepository extends IMovieRepository {
  final MovieService _movieService;

  MovieRepository(this._movieService);

  @override
  Future<Either<NetworkException, MovieList>> fetchMovies(
      {int page = 1, int genreId = 0}) async {
    final genre = genreId > 0 ? genreId.toString() : null;

    final response = await _movieService.fetchMovies(
      page: page,
      genre: genre,
    );

    if (response.isSuccessful) {
      final movieListResponse = response.body;

      MovieList movieList = MovieList(
        page: movieListResponse?.page ?? 0,
        totalPages: movieListResponse?.totalPages ?? 0,
      );

      final movies = movieListResponse?.results ?? List.empty();

      return right(
        movieList.copyWith(
          movies: movies.map((e) => mapToMovie(e)).toList(),
        ),
      );
    }

    return left(NetworkException(status: response.statusCode));
  }

  @override
  Future<Either<NetworkException, Movie>> getMovieDetails(int movieId) async {
    final response = await _movieService.fetchMovieDetails(movieId);

    if (response.isSuccessful) {
      return right(mapToMovie(response.bodyOrThrow));
    }

    return left(NetworkException(status: response.statusCode));
  }

  @override
  Future<Either<NetworkException, List<Video>>> getMovieVideos(
      int movieId) async {
    final response = await _movieService.fetchMovieVideos(movieId);

    if (response.isSuccessful) {
      final videos = response.bodyOrThrow.results ?? List.empty();

      return right(videos.map((e) => mapToVideo(e)).toList());
    }

    return left(NetworkException(status: response.statusCode));
  }

  @override
  Future<Either<NetworkException, ReviewList>> getMovieReviews(int movieId,
      {int page = 1}) async {
    final response = await _movieService.fetchMovieReviews(movieId, page);

    if (response.isSuccessful) {
      ReviewList reviewList = ReviewList(page: response.bodyOrThrow.page ?? 0);

      final reviews = response.bodyOrThrow.results ?? List.empty();

      return right(
        reviewList.copyWith(
            reviews: reviews.map((e) => mapToReview(e)).toList()),
      );
    }

    return left(NetworkException(status: response.statusCode));
  }
}
