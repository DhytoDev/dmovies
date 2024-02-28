import 'package:dartz/dartz.dart';
import 'package:dmovies/src/data/response/genre_list_dto.dart';

import '../../core/exceptions.dart';
import '../model/genre.dart';

abstract class IGenreRepository {
  Future<Either<NetworkException, List<Genre>>> getMovieGenres();

  Genre mapToGenre(GenreDto dto) => Genre(
        id: dto.id,
        name: dto.name,
      );
}
