import 'package:dmovies/src/core/ui_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/genre.dart';
import '../../../domain/repositories/genre_repository.dart';

@injectable
class MovieGenreCubit extends Cubit<UiState<List<Genre>>> {
  final IGenreRepository _genreRepository;

  MovieGenreCubit(this._genreRepository) : super(InitialState());

  Future<void> fetchMovieGenres() async {
    emit(LoadingState());

    final result = await _genreRepository.getMovieGenres();

    return result.fold((err) {
      emit(ErrorState(err.status.toString()));
    }, (genres) {
      emit(SuccessState(genres));
    });
  }
}
