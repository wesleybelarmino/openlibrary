import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:openlibrary/src/di/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies(String env) => $initGetIt(getIt, environment: env);
