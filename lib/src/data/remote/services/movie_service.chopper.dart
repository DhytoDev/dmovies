// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieService extends MovieService {
  _$MovieService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieService;

  @override
  Future<Response<MovieListDto>> fetchMovies({
    int page = 1,
    String? genre,
    String? keywords,
  }) {
    final Uri $url = Uri.parse('/discover/movie');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'with_genres': genre,
      'with_keywords': keywords,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieListDto, MovieListDto>($request);
  }

  @override
  Future<Response<MovieDto>> fetchMovieDetails(int id) {
    final Uri $url = Uri.parse('/movie/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MovieDto, MovieDto>($request);
  }

  @override
  Future<Response<VideoListDto>> fetchMovieVideos(int id) {
    final Uri $url = Uri.parse('/movie/${id}/videos');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VideoListDto, VideoListDto>($request);
  }

  @override
  Future<Response<ReviewListDto>> fetchMovieReviews(
    int id,
    int page,
  ) {
    final Uri $url = Uri.parse('/movie/${id}/reviews');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ReviewListDto, ReviewListDto>($request);
  }
}
