import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dmovies/src/data/remote/response/review_list_dto.dart';
import 'package:dmovies/src/data/remote/response/video_dto.dart';
// import 'package:http/io_client.dart' as http;
import 'package:http/http.dart' as http;

import 'json_converter.dart';
import 'response/genre_list_dto.dart';
import 'response/movie_dto.dart';
import 'response/movie_list_dto.dart';

final class NetworkClient extends ChopperClient {
  final http.BaseClient _httpClient;

  NetworkClient(this._httpClient)
      : super(
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
          interceptors: [
            (Request req) async {
              final params = Map<String, dynamic>.from(req.parameters);
              params['api_key'] = '678ef42a1b584848591cbd02ac3899c3';

              return req.copyWith(parameters: params);
            },
            HttpLoggingInterceptor(),
          ],
          client: _httpClient,
        );
}
