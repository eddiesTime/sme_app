import 'package:dartz/dartz.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/application/theme/theme_store.dart';
import 'package:states_rebuilder_example/domain/weather/i_weather_facade.dart';
import 'package:states_rebuilder_example/domain/weather/weather_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class WeatherStore {
  final IWeatherFacade _weatherFacade;
  final ReactiveModel<ThemeStore> _themeStore;
  WeatherStore(this._weatherFacade, this._themeStore, this._weatherEntity);

  WeatherEntity _weatherEntity;
  WeatherEntity get weatherEntity => _weatherEntity;

  Future<void> fetchWeatherForLocation(String location) async {
    _weatherEntity = WeatherEntity.initial();
    final WeatherResponse _wr =
        await _weatherFacade.getWeatherForLocation(location: location);
    _weatherEntity = _weatherEntity.copyWith(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
    _weatherChanged();
  }

  Future<void> refreshWeatherForLocation(String location) async {
    final WeatherResponse _wr =
        await _weatherFacade.getWeatherForLocation(location: location);
    _weatherEntity = _weatherEntity.copyWith(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
    _weatherChanged();
  }

  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  void _weatherChanged() {
    _themeStore.setState(
        (store) => store.mapWeatherConditionToTheme(getWeatherCondition()));
  }
}
