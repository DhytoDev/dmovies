import 'package:dartz/dartz.dart';
import 'package:dmovies/src/core/exceptions.dart';
import 'package:dmovies/src/data/remote/services/movie_service.dart';
import 'package:dmovies/src/data/repositories/movie_repository.dart';
import 'package:dmovies/src/domain/model/movie_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../client.dart';
import 'movie_response.dart';

void main() {
  test(
    'fetch movies returns successfully',
    () async {
      final httpClient = MockClient((http.Request request) async {
        return http.Response(movieListResponse, 200);
      });

      final chopperClient = buildClient(httpClient);

      final movieService = MovieService.create(chopperClient);

      final sut = MovieRepository(movieService);

      final result = await sut.fetchMovies(page: 1, genreId: 1);

      final movieList = result.getOrElse(() => const MovieList());

      expect(movieList.page, 1);
      expect(movieList.data.first.title, 'Alien');
    },
  );

  test(
    'fetch movies returns error',
    () async {
      final httpClient = MockClient((http.Request request) async {
        return http.Response("{}", 500);
      });

      final chopperClient = buildClient(httpClient);

      final movieService = MovieService.create(chopperClient);

      final sut = MovieRepository(movieService);

      final result = await sut.fetchMovies(page: 1, genreId: 1);

      final error = result.foldLeft(const NetworkException(status: 500), (previous, r) => previous);

      expect(result.isLeft(), true);
      expect(error.status, 500);
    },
  );
}
