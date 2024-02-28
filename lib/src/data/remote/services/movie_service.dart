import 'package:chopper/chopper.dart';
import 'package:dmovies/src/data/response/genre_list_dto.dart';
import 'package:dmovies/src/data/response/movie_list_dto.dart';
import 'package:injectable/injectable.dart';

part 'movie_service.chopper.dart';

@lazySingleton
@ChopperApi()
abstract class MovieService extends ChopperService {
  @factoryMethod
  static MovieService create([ChopperClient? chopperClient]) =>
      _$MovieService(chopperClient);

  @Get(path: '/discover/movie')
  Future<Response<MovieListDto>> fetchMovies({
    @Query('page') int page = 1,
    @Query('with_genres') String? genre,
    @Query('with_keywords') String? keywords,
  });
}
