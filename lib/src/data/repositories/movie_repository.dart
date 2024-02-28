import 'package:dartz/dartz.dart';
import 'package:dmovies/src/core/exceptions.dart';
import 'package:dmovies/src/data/response/movie_list_dto.dart';
import 'package:dmovies/src/domain/model/movie.dart';
import 'package:dmovies/src/domain/model/movie_list.dart';
import 'package:dmovies/src/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

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

      final movieList =
          movieListResponse?.results?.map((e) => mapToMovie(e)).toList() ??
              List.empty();

      return right(
        MovieList(
          page: movieListResponse?.page ?? 0,
          movies: movieList,
          totalPages: movieListResponse?.totalPages ?? 0,
        ),
      );
    }

    return left(NetworkException(status: response.statusCode));
  }

  @override
  Future<Either<NetworkException, Movie>> getMovieDetails(int movieId) {
    throw UnimplementedError();
  }
}
