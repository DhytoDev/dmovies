import 'package:dartz/dartz.dart';
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
  }
}
