import 'dart:async';

import 'package:dmovies/src/domain/repositories/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'movie_event.dart';
import 'movie_list_state.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieListState> {
  MovieBloc(this._movieRepository) : super(const MovieListState()) {
    on<FetchMoviesEvent>(_getMovies);
  }

  final IMovieRepository _movieRepository;

  FutureOr<void> _getMovies(
    FetchMoviesEvent event,
    Emitter<MovieListState> emit,
  ) async {
    if (event.page < 1 || event.page > 500) return;

    final movies = await _movieRepository.fetchMovies(
      page: event.page,
      genreId: event.genreId,
    );

    return movies.fold(
      (l) {
        emit(
          state.copyWith(errorMessage: l.status.toString()),
        );
      },
      (r) {
        emit(
          state.copyWith(
            page: r.page,
            totalPages: r.totalPages,
            movies: List.of(state.movies)..addAll(r.movies),
          ),
        );
      },
    );
  }
}
