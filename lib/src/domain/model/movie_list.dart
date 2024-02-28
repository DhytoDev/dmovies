import 'package:dmovies/src/domain/model/paging_model.dart';

import 'movie.dart';

class MovieList extends PagingModel<Movie> {
  const MovieList({
    super.page,
    super.totalPages,
    super.data,
  });

  MovieList copyWith({List<Movie>? movies}) {
    return MovieList(
      page: page,
      data: movies ?? data,
    );
  }
}
