import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

late final GetIt getIt;

@injectableInit
Future<void> configureDataInjection(
  GetIt mainGetIt, {
  required String environment,
}) async {
  await $initGetIt(mainGetIt, environment: environment);
  getIt = mainGetIt;
}
