import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

late final GetIt getIt;

@injectableInit
void configureDomainInjection(GetIt mainGetIt, {required String environment}) {
  $initGetIt(mainGetIt, environment: environment);
  getIt = mainGetIt;
}
