import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:states_rebuilder_example/domain/weather/i_weather_facade.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

@prod
@lazySingleton
@RegisterAs(IWeatherFacade)
class WeatherRepositoryFacade implements IWeatherFacade {
  final WeatherRepository _weatherRepository;

  WeatherRepositoryFacade(this._weatherRepository);

  @override
  WeatherCondition getWeatherConditionForWeather({Weather weather}) {
    return weather.mapConditionToWeatherCondition(weather.condition);
  }

  @override
  Future<WeatherResponse> getWeatherForLocation(
      {@required String location}) async {
    final WeatherResponse _wr =
        await _weatherRepository.getWeatherFor(city: location);
    return _wr;
  }

  @override
  Future<WeatherResponse> refreshWeatherData(
      {@required String location}) async {
    final WeatherResponse _wr =
        await _weatherRepository.getWeatherFor(city: location);
    return _wr;
  }
}
