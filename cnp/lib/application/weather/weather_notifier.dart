import 'package:cnp/application/theme/theme_notifier.dart';
import 'package:cnp/domain/weather/i_weather_facade.dart';
import 'package:cnp/domain/weather/weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Extends [ChangeNotifier] to be used by [ChangeNotifierProvider].
///
/// Handles weather data related logic.
@lazySingleton
class WeatherNotifier extends ChangeNotifier {
  WeatherNotifier(
      this._weatherEntity, this._themeNotifier, this._weatherFacade);
  final ThemeNotifier _themeNotifier;
  final IWeatherFacade _weatherFacade;
  WeatherEntity _weatherEntity;
  WeatherEntity get weatherEntity => _weatherEntity;

  /// Calls the [ThemeNotifier]'s method [mapWeatherCondition()] for a given [WeatherCondition].
  void weatherChanged() {
    final WeatherCondition condition = getWeatherCondition();
    _themeNotifier.mapWeatherCondition(condition: condition);
  }

  /// Returns a [WeatherCondition] with the help of the local [WeatherEntity].
  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weatherFacade.getWeatherConditionForWeather(weather: _weather);
  }

  /// Updates our local [WeatherEntity] with a new [WeatherEntity] when the weather data for a given [location] has been refreshed successfully.
  ///
  /// Updates our local [WeatherEntity] with a [WeatherEntity.loadingFailure()] when an error occured while refreshing the weather data for a given [location].
  ///
  /// Calls [weatherChanged()] to delegate the updating of the theme.
  ///
  /// Notifies the listeners of [WeatherNotifier] after the local [WeatherEntity] has been updated.
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

  /// Updates our local [WeatherEntity] with a new [WeatherEntity] when the weather data for a given [location] has been fetched successfully.
  ///
  /// Updates our local [WeatherEntity] with a [WeatherEntity.loadingFailure()] when an error occured while fetching the weather data for a given [location].
  ///
  /// Calls [weatherChanged()] to delegate the updating of the theme.
  ///
  /// Notifies the listeners of [WeatherNotifier] after the local [WeatherEntity] has been updated.
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
