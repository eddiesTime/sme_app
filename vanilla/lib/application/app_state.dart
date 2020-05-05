import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vanilla/domain/settings/settings_entity.dart';
import 'package:vanilla/domain/theme/theme_entity.dart';
import 'package:vanilla/domain/weather/i_weather_facade.dart';
import 'package:vanilla/domain/weather/weather_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Is a container class that holds the state of different `app states` used in multiple part of the app.
@lazySingleton
class AppState {
  /// Holds a reference to `WeatherRepositoryFacade` in the infrastructure layer where the
  /// interface `IWeatherFacade` is implemented.
  final IWeatherFacade _weatherFacade;

  WeatherEntity weatherEntity;
  ThemeEntity themeEntity;
  SettingsEntity settingsEntity;

  AppState(
    this._weatherFacade, {
    @required this.weatherEntity,
    @required this.themeEntity,
    @required this.settingsEntity,
  });

  /// Sets the app state of weather data to [WeatherEntity.loading()]
  void indicateLoading() {
    weatherEntity = WeatherEntity.loading();
  }

  /// Updates the app state with loaded weather data that indicates
  /// that the weather has been loaded successfully.
  ///
  /// Otherwise it updates the app state that indicates a loading failure.
  Future<void> fetchWeather({@required String location}) async {
    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      weatherEntity = weatherEntity.copyWith(
        weatherResponse: some(_wr),
        city: location,
        lastUpdated: some(DateTime.now()),
        isLoading: false,
      );
      updateThemeToMatchWeatherCondition(weatherResponse: _wr);
    } catch (e) {
      weatherEntity = WeatherEntity.loadingFailure();
    }
  }

  /// Triggers the process to update the theme related to the `WeatherCondition`
  /// which is provided by the `WeatherEntity`.
  void updateThemeToMatchWeatherCondition(
      {@required WeatherResponse weatherResponse}) {
    final Weather _weather = weatherResponse.weatherCollection.first;
    final WeatherCondition weatherCondition =
        _weatherFacade.getWeatherConditionForWeather(weather: _weather);
    themeEntity = themeEntity.updateThemeToMatchWeatherCondition(
        condition: weatherCondition);
  }

  /// Toggles the temperature unit between `celsius` and `fahrenheit`.
  void toggleTemperatureUnit() {
    settingsEntity = settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? SettingsEntity.fahrenheit()
        : SettingsEntity.celsius();
  }
}
