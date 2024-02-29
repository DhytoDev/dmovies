import 'package:chopper/chopper.dart';
import 'package:dmovies/src/data/remote/json_converter.dart';
import 'package:dmovies/src/data/remote/response/genre_list_dto.dart';
import 'package:dmovies/src/data/remote/response/movie_dto.dart';
import 'package:dmovies/src/data/remote/response/movie_list_dto.dart';
import 'package:dmovies/src/data/remote/response/review_list_dto.dart';
import 'package:dmovies/src/data/remote/response/video_dto.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

typedef ApiService<S extends ChopperService> = S Function(ChopperClient client);

S createService<S extends ChopperService>({
  required http.Response response,
  required ApiService<S> service,
}) {
  final httpClient = MockClient((http.Request request) async => response);

  final chopperClient = buildClient(httpClient);

  return service.call(chopperClient);
}

ChopperClient buildClient(http.BaseClient httpClient) {
  return ChopperClient(
    client: httpClient,
    baseUrl: Uri.parse('https://api.themoviedb.org/3'),
    converter: JsonSerializableConverter(
      {
        MovieListDto: (json) => MovieListDto.fromJson(json),
        GenreListDto: (json) => GenreListDto.fromJson(json),
        MovieDto: (json) => MovieDto.fromJson(json),
        VideoListDto: (json) => VideoListDto.fromJson(json),
        ReviewListDto: (json) => ReviewListDto.fromJson(json),
      },
    ),
  );
}
