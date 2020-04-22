import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/stores/theme_store.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class WeatherStore {
  final WeatherRepository weatherRepo;
  final ReactiveModel<ThemeStore> themeStore;
  WeatherStore(
      {@required WeatherRepository this.weatherRepo,
      @required ReactiveModel<ThemeStore> this.themeStore});

  String _city;

  WeatherResponse _weatherResponse;
  WeatherResponse get weatherResponse => _weatherResponse;

  DateTime _lastUpdated;
  DateTime get lastUpdated => _lastUpdated;

  void getWeather(String cityName) async {
    _weatherResponse = null;
    _weatherResponse = await weatherRepo.getWeatherFor(city: cityName);
    _lastUpdated = DateTime.now();
    _weatherChanged();
    _city = cityName;
  }

  void refreshWeather() async {
    _weatherResponse = await weatherRepo.getWeatherFor(city: _city);
    _weatherChanged();
    _lastUpdated = DateTime.now();
  }

  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherResponse.weatherCollection.first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  void _weatherChanged() {
    themeStore.setState(
        (store) => store.mapWeatherConditionToTheme(getWeatherCondition()));
  }
}
