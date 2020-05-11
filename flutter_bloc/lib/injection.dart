import 'package:flutter_bloc_example/injection.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// The instantiation of our service generator.
final GetIt getIt = GetIt.instance;

/// Initialises the specified dependencies used in our service locator [getIt].
///
/// The parameter [env] can be used to differentiate between production, test or development.
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
