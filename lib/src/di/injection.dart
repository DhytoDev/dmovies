import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:injectable/injectable.dart';

import '../data/remote/network_client.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
  preferRelativeImports: true,
)
Future<void> configureInjection() async {
  getIt.init(environment: Environment.prod);

  final httpClient = HttpClient()
    ..connectionTimeout = const Duration(seconds: 200);

  getIt.registerLazySingleton<ChopperClient>(
    () => NetworkClient(IOClient(httpClient)),
  );
}
