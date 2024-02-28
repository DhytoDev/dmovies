import 'dart:async';

import 'package:dmovies/src/domain/repositories/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'movie_list_state.dart';

sealed class MovieEvent {}

class FetchMoviesEvent extends MovieEvent {
  final int page;
  final int genreId;

  FetchMoviesEvent({
    this.page = 0,
    this.genreId = 0,
  });
}