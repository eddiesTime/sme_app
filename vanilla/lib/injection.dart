import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vanilla/injection.iconfig.dart';

final GetIt _getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(_getIt, environment: env);
}
