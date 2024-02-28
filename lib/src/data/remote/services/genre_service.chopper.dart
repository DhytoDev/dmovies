// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$GenreService extends GenreService {
  _$GenreService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = GenreService;

  @override
  Future<Response<GenreListDto>> fetchMovieGenres() {
    final Uri $url = Uri.parse('/genre/movie/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GenreListDto, GenreListDto>($request);
  }
}
