import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inherited_widget/domain/entities.dart';
import 'package:inherited_widget/domain/weather/i_weather_facade.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

@lazySingleton
class AppState {
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

  void indicateLoading() {
    weatherEntity = WeatherEntity.loading();
  }

  Future<void> getWeatherForLocation({@required String location}) async {
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

  void updateThemeToMatchWeatherCondition(
      {@required WeatherResponse weatherResponse}) {
    final Weather _weather = weatherResponse.weatherCollection.first;
    final WeatherCondition weatherCondition =
        _weatherFacade.getWeatherConditionForWeather(weather: _weather);
    themeEntity = themeEntity.updateThemeToMatchWeatherCondition(
        condition: weatherCondition);
  }

  void toggleTemperatureUnit() {
    settingsEntity = settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? SettingsEntity.fahrenheit()
        : SettingsEntity.celsius();
  }
}
