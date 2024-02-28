import 'dart:async';

import 'package:dmovies/src/domain/repositories/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/movie.dart';

class MovieListState extends Equatable {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final String errorMessage;

  const MovieListState({
    this.page = 0,
    this.movies = const [],
    this.totalPages = 0,
    this.errorMessage = '',
  });

  MovieListState copyWith({
    int? page,
    List<Movie>? movies,
    int? totalPages,
    String? errorMessage,
  }) {
    return MovieListState(
      page: page ?? this.page,
      movies: movies ?? this.movies,
      totalPages: totalPages ?? this.totalPages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [page, movies, totalPages];
}