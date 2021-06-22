import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
Future<void> configureDomainInjection(GetIt getIt, String env) =>
    $initGetIt(getIt, environment: env);
