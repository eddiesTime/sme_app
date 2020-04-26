import 'package:cnp/application/theme/theme_notifier.dart';
import 'package:cnp/domain/weather/i_weather_facade.dart';
import 'package:cnp/domain/weather/weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

@lazySingleton
class WeatherNotifier extends ChangeNotifier {
  WeatherNotifier(
      this._weatherEntity, this._themeNotifier, this._weatherFacade);
  final ThemeNotifier _themeNotifier;
  final IWeatherFacade _weatherFacade;
  WeatherEntity _weatherEntity;
  WeatherEntity get weatherEntity => _weatherEntity;

  void weatherChanged() {
    final WeatherCondition condition = getWeatherCondition();
    _themeNotifier.mapWeatherCondition(condition: condition);
  }

  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weatherFacade.getWeatherConditionForWeather(weather: _weather);
  }

  Future<void> refreshWeatherForLocation({String location}) async {
    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      _weatherEntity = _weatherEntity.copyWith(
        weatherResponse: some(_wr),
        lastUpdated: some(DateTime.now()),
      );
      notifyListeners();
      weatherChanged();
    } catch (err) {
      _weatherEntity = WeatherEntity.loadingFailure();
      notifyListeners();
    }
  }

  Future<void> fetchWeatherForLocation({String location}) async {
    _weatherEntity = WeatherEntity.loading();
    notifyListeners();

    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      _weatherEntity = WeatherEntity(
        weatherResponse: some(_wr),
        city: location,
        hasError: false,
        lastUpdated: some(DateTime.now()),
        isLoading: false,
      );
      notifyListeners();
      weatherChanged();
    } catch (err) {
      _weatherEntity = WeatherEntity.loadingFailure();
      notifyListeners();
    }
  }
}
