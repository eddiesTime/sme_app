import 'package:injectable/injectable.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

@registerModule
abstract class WeatherRepositoryInjectableModule {
  @lazySingleton
  WeatherRepository get weatherRepository => WeatherRepository();
}
