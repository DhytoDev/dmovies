import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    MaterialRoute(page: GenreRoute.page, initial: true),
    MaterialRoute(page: MovieRoute.page)
  ];
}