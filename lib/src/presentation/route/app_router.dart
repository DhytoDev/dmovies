import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../../domain/model/movie.dart';
import '../screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    MaterialRoute(page: GenreRoute.page, initial: true),
    MaterialRoute(page: MovieRoute.page),
    MaterialRoute(page: MovieDetailsRoute.page),
    MaterialRoute(page: ReviewListRoute.page),
  ];
}