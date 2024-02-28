import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import '../response/movie_dto.dart';
import '../response/movie_list_dto.dart';
import '../response/video_dto.dart';
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

  @Get(path: '/movie/{id}')
  Future<Response<MovieDto>> fetchMovieDetails(@Path() int id);

  @Get(path: '/movie/{id}/videos')
  Future<Response<VideoListDto>> fetchMovieVideos(@Path() int id);
}
