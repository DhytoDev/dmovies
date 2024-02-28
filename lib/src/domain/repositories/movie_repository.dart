import 'package:dartz/dartz.dart';
import 'package:dmovies/src/core/exceptions.dart';
import 'package:dmovies/src/data/response/movie_list_dto.dart';
import 'package:dmovies/src/domain/model/movie.dart';
import 'package:dmovies/src/domain/model/movie_list.dart';

abstract class IMovieRepository {
  Future<Either<NetworkException, MovieList>> fetchMovies({
    int page = 1,
    int genreId = 0,
  });

  Future<Either<NetworkException, Movie>> getMovieDetails(int movieId);

  Movie mapToMovie(MovieDto dto) => Movie(
      id: dto.id ?? 0,
      title: dto.title ?? '',
      posterPath: dto.posterPath ?? '',
      backdropPath: dto.backdropPath ?? '',
      overview: dto.overview ?? '',
      popularity: dto.popularity ?? 0.0,
      voteAverage: dto.voteAverage ?? 0.0,
      voteCount: dto.voteCount ?? 0,
    );
}
