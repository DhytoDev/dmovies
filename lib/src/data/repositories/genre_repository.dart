import 'package:dartz/dartz.dart';
import 'package:dmovies/src/core/exceptions.dart';
import 'package:dmovies/src/domain/model/genre.dart';
import 'package:dmovies/src/domain/repositories/genre_repository.dart';
import 'package:injectable/injectable.dart';

import '../remote/services/genre_service.dart';

@LazySingleton(as: IGenreRepository)
final class GenreRepository extends IGenreRepository {
  final GenreService _genreService;

  GenreRepository(this._genreService);

  @override
  Future<Either<NetworkException, List<Genre>>> getMovieGenres() async {
    final response = await _genreService.fetchMovieGenres();

    if (response.isSuccessful) {
      final genresResponse = response.body?.genres;

      final genres = genresResponse?.map((e) => mapToGenre(e)).toList();

      return right(genres ?? List.empty());
    }

    return left(NetworkException(status: response.statusCode));
  }
}
