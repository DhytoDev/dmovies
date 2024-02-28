import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dmovies/src/data/remote/services/genre_service.dart';
import 'package:dmovies/src/data/remote/services/movie_service.dart';
import 'package:dmovies/src/data/response/genre_list_dto.dart';
import 'package:dmovies/src/data/response/movie_detail_dto.dart';
import 'package:dmovies/src/data/response/movie_list_dto.dart';
import 'package:http/io_client.dart' as http;

import 'json_converter.dart';

final class NetworkClient extends ChopperClient {
  final HttpClient _httpClient;

  NetworkClient(this._httpClient)
      : super(
          baseUrl: Uri.parse('https://api.themoviedb.org/3'),
          converter: JsonSerializableConverter(
            {
              MovieListDto: (json) => MovieListDto.fromJson(json),
              GenreListDto: (json) => GenreListDto.fromJson(json),
              MovieDetailDto: (json) => MovieDetailDto.fromJson(json),
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
          client: http.IOClient(_httpClient),
        );
}
