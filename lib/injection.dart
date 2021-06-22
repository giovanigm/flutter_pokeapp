import 'package:domain/injection.dart';
import 'package:data/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  GetIt.instance.allowReassignment = true;
  await configureDataInjection(getIt, environment: env);
  configureDomainInjection(getIt, environment: env);
  $initGetIt(getIt, environment: env);
}
