import 'package:dmovies/src/core/exceptions.dart';
import 'package:dmovies/src/data/remote/services/genre_service.dart';
import 'package:dmovies/src/data/repositories/genre_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../client.dart';
import 'movie_response.dart';

void main() {
  test('fetch movie genres returns success', () async {
    final genreService = createService<GenreService>(
      response: Response(genreListResponse, 200),
      service: (client) => GenreService.create(client),
    );

    final sut = GenreRepository(genreService);

    final result = await sut.getMovieGenres();

    final genreList = result.getOrElse(() => List.empty());

    expect(genreList.length, 2);
    expect(genreList.first.name, "Action");
  });
  test('fetch movie genres returns an exception', () async {
    final genreService = createService<GenreService>(
      response: Response(errorResponse, 404),
      service: (client) => GenreService.create(client),
    );

    final sut = GenreRepository(genreService);

    final result = await sut.getMovieGenres();

    final error = result.foldLeft(
        const NetworkException(status: 404), (previous, r) => previous);

    expect(result.isLeft(), true);
    expect(error.status, 404);
  });
}
