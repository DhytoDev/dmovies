// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/services/genre_service.dart' as _i3;
import '../data/remote/services/movie_service.dart' as _i8;
import '../data/repositories/genre_repository.dart' as _i6;
import '../data/repositories/movie_repository.dart' as _i10;
import '../domain/repositories/genre_repository.dart' as _i5;
import '../domain/repositories/movie_repository.dart' as _i9;
import '../presentation/discover/bloc/movie_bloc.dart' as _i11;
import '../presentation/discover/bloc/movie_details_bloc.dart' as _i12;
import '../presentation/genre/bloc/genre_bloc.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.GenreService>(
        () => _i3.GenreService.create(gh<_i4.ChopperClient>()));
    gh.lazySingleton<_i5.IGenreRepository>(
        () => _i6.GenreRepository(gh<_i3.GenreService>()));
    gh.factory<_i7.MovieGenreCubit>(
        () => _i7.MovieGenreCubit(gh<_i5.IGenreRepository>()));
    gh.lazySingleton<_i8.MovieService>(
        () => _i8.MovieService.create(gh<_i4.ChopperClient>()));
    gh.lazySingleton<_i9.IMovieRepository>(
        () => _i10.MovieRepository(gh<_i8.MovieService>()));
    gh.factory<_i11.MovieBloc>(
        () => _i11.MovieBloc(gh<_i9.IMovieRepository>()));
    gh.factory<_i12.MovieDetailsBloc>(
        () => _i12.MovieDetailsBloc(gh<_i9.IMovieRepository>()));
    return this;
  }
}
