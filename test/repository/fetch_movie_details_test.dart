import 'package:dmovies/src/core/exceptions.dart';
import 'package:dmovies/src/data/remote/services/movie_service.dart';
import 'package:dmovies/src/data/repositories/movie_repository.dart';
import 'package:dmovies/src/domain/model/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../client.dart';
import 'movie_response.dart';

void main() {
  test('fetch movie details returns success', () async {
    final movieService = createService<MovieService>(
      response: Response(movieDetailsResponse, 200),
      service: (client) => MovieService.create(client),
    );

    final sut = MovieRepository(movieService);

    final result = await sut.getMovieDetails(200);

    final movieDetails = result.getOrElse(() => const Movie());

    expect(movieDetails.id, 200);

  });
  test('fetch movie details return an exception', () async {
    final movieService = createService<MovieService>(
      response: Response(errorResponse, 404),
      service: (client) => MovieService.create(client),
    );

    final sut = MovieRepository(movieService);

    final result = await sut.getMovieDetails(200);

    final error = result.foldLeft(
        const NetworkException(status: 404), (previous, r) => previous);

    expect(result.isLeft(), true);
    expect(error.status, 404);
  });
}
