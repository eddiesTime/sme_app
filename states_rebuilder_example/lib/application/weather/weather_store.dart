import 'package:dartz/dartz.dart';
import 'package:states_rebuilder_example/domain/weather/i_weather_facade.dart';
import 'package:states_rebuilder_example/domain/weather/weather_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Used by the reative model in by states_provider.
class WeatherStore {
  /// Holds a reference to `WeatherRepositoryFacade` in the infrastructure layer where the
  /// interface `IWeatherFacade` is implemented.
  final IWeatherFacade _weatherFacade;
  WeatherStore(this._weatherFacade, this._weatherEntity);

  WeatherEntity _weatherEntity;
  WeatherEntity get weatherEntity => _weatherEntity;

  /// Fetches the weather for given [location]. It handles the
  /// updating of the [WeatherEntity] and delegates the
  /// updating of the theme to the `ThemeStore`.
  Future<void> fetchWeatherForLocation(String location) async {
    _weatherEntity = WeatherEntity.initial();
    final WeatherResponse _wr =
        await _weatherFacade.getWeatherForLocation(location: location);
    _weatherEntity = _weatherEntity.copyWith(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
  }

  /// Refreshes the weather for given [location]. It handles the
  /// updating of the [WeatherEntity] and delegates the
  /// updating of the theme to the `ThemeStore`.
  Future<void> refreshWeatherForLocation(String location) async {
    final WeatherResponse _wr =
        await _weatherFacade.getWeatherForLocation(location: location);
    _weatherEntity = _weatherEntity.copyWith(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
  }

  /// Returns the `WeatherCondition` for the current weather.
  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }
}
