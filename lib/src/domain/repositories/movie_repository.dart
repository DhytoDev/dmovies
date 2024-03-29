import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dmovies/src/data/remote/response/review_list_dto.dart';
import 'package:dmovies/src/data/remote/response/video_dto.dart';
import 'package:dmovies/src/domain/model/review.dart';
import 'package:dmovies/src/domain/model/video.dart';

import '../../core/exceptions.dart';
import '../../data/remote/response/movie_dto.dart';
import '../model/movie.dart';
import '../model/movie_list.dart';

abstract class IMovieRepository {
  Future<Either<NetworkException, MovieList>> fetchMovies({
    int page = 1,
    int genreId = 0,
  });

  Future<Either<NetworkException, Movie>> getMovieDetails(int movieId);

  Future<Either<NetworkException, List<Video>>> getMovieVideos(int movieId);

  Future<Either<NetworkException, ReviewList>> getMovieReviews(int movieId,
      {int page = 1});

  static const backdropPathUrl = 'https://image.tmdb.org/t/p/w500';
  static const posterPathUrl = 'https://image.tmdb.org/t/p/w200';

  Movie mapToMovie(MovieDto dto) => Movie(
        id: dto.id ?? 0,
        title: dto.title ?? '',
        posterPath: '$posterPathUrl/${dto.posterPath}' ?? '',
        backdropPath: '$backdropPathUrl/${dto.backdropPath}' ?? '',
        overview: dto.overview ?? '',
        popularity: dto.popularity ?? 0.0,
        voteAverage: dto.voteAverage ?? 0.0,
        voteCount: dto.voteCount ?? 0,
      );

  Video mapToVideo(VideoDto dto) => Video(
        name: dto.name ?? '',
        id: dto.id ?? '',
        key: dto.key ?? '',
        type: dto.type ?? '',
      );

  Review mapToReview(ReviewDto dto) => Review(
    author: dto.author ?? '',
    url: dto.url ?? '',
    content: dto.content ?? '',
  );
}
