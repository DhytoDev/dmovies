// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GenreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const GenreScreen()),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: MovieDetailsScreen(
          key: args.key,
          movie: args.movie,
        )),
      );
    },
    MovieRoute.name: (routeData) {
      final args = routeData.argsAs<MovieRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: MovieScreen(
          key: args.key,
          genreId: args.genreId,
        )),
      );
    },
    ReviewListRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ReviewListScreen(
          key: args.key,
          movie: args.movie,
        )),
      );
    },
  };
}

/// generated route for
/// [GenreScreen]
class GenreRoute extends PageRouteInfo<void> {
  const GenreRoute({List<PageRouteInfo>? children})
      : super(
          GenreRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailsScreen]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required Movie movie,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static const PageInfo<MovieDetailsRouteArgs> page =
      PageInfo<MovieDetailsRouteArgs>(name);
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movie,
  });

  final Key? key;

  final Movie movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [MovieScreen]
class MovieRoute extends PageRouteInfo<MovieRouteArgs> {
  MovieRoute({
    Key? key,
    required int genreId,
    List<PageRouteInfo>? children,
  }) : super(
          MovieRoute.name,
          args: MovieRouteArgs(
            key: key,
            genreId: genreId,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieRoute';

  static const PageInfo<MovieRouteArgs> page = PageInfo<MovieRouteArgs>(name);
}

class MovieRouteArgs {
  const MovieRouteArgs({
    this.key,
    required this.genreId,
  });

  final Key? key;

  final int genreId;

  @override
  String toString() {
    return 'MovieRouteArgs{key: $key, genreId: $genreId}';
  }
}

/// generated route for
/// [ReviewListScreen]
class ReviewListRoute extends PageRouteInfo<ReviewListRouteArgs> {
  ReviewListRoute({
    Key? key,
    required Movie movie,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewListRoute.name,
          args: ReviewListRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewListRoute';

  static const PageInfo<ReviewListRouteArgs> page =
      PageInfo<ReviewListRouteArgs>(name);
}

class ReviewListRouteArgs {
  const ReviewListRouteArgs({
    this.key,
    required this.movie,
  });

  final Key? key;

  final Movie movie;

  @override
  String toString() {
    return 'ReviewListRouteArgs{key: $key, movie: $movie}';
  }
}
