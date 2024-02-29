import 'package:dmovies/src/core/exceptions.dart';
import 'package:dmovies/src/data/remote/services/movie_service.dart';
import 'package:dmovies/src/data/repositories/movie_repository.dart';
import 'package:dmovies/src/domain/model/review.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../client.dart';
import 'movie_response.dart';

void main() {
  test('fetch movie reviews returns success', () async {
    final movieService = createService<MovieService>(
      response: Response(movieReviewsResponse, 200),
      service: (client) => MovieService.create(client),
    );

    final sut = MovieRepository(movieService);

    final result = await sut.getMovieReviews(200);

    final reviewList = result.getOrElse(() => const ReviewList());

    expect(reviewList.page, 1);
    expect(reviewList.data.first.author, 'TheTenth');
  });

  test('fetch movie reviews return an exception', () async {
    final movieService = createService<MovieService>(
      response: Response(errorResponse, 404),
      service: (client) => MovieService.create(client),
    );

    final sut = MovieRepository(movieService);

    final result = await sut.getMovieReviews(200);

    final error = result.foldLeft(
        const NetworkException(status: 404), (previous, r) => previous);

    expect(result.isLeft(), true);
    expect(error.status, 404);
  });
}
