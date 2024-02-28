import 'package:chopper/chopper.dart';
import 'package:dmovies/src/data/response/genre_list_dto.dart';
import 'package:injectable/injectable.dart';

part 'genre_service.chopper.dart';

@lazySingleton
@ChopperApi()
abstract class GenreService extends ChopperService {
  @factoryMethod
  static GenreService create([ChopperClient? chopperClient]) =>
      _$GenreService(chopperClient);

  @Get(path: '/genre/movie/list')
  Future<Response<GenreListDto?>> fetchMovieGenres();
}
