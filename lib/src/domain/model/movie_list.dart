import 'package:equatable/equatable.dart';

import 'movie.dart';

class MovieList extends Equatable {
  final int page;
  final List<Movie> movies;
  final int totalPages;

  const MovieList({
    required this.page,
    this.movies = const [],
    this.totalPages = 0,
  });



  @override
  List<Object?> get props => [page, movies];
}
