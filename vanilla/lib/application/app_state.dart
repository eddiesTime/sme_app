import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vanilla/domain/settings/settings_entity.dart';
import 'package:vanilla/domain/theme/theme_entity.dart';
import 'package:vanilla/domain/weather/i_weather_facade.dart';
import 'package:vanilla/domain/weather/weather_entity.dart';
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

  // Future<void> getWeatherForLocation({@required String location}) async {
  //   try {
  //     final WeatherResponse _wr =
  //         await _weatherFacade.getWeatherForLocation(location: location);
  //     weatherEntity = weatherEntity.copyWith(
  //       weatherResponse: some(_wr),
  //       lastUpdated: some(DateTime.now()),
  //       isLoading: false,
  //     );
  //   } catch (e) {
  //     weatherEntity = WeatherEntity.loadingFailure();
  //   }
  // }

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

  // void saveWeatherResponseInAppState(WeatherResponse wr) {
  //   weatherResponse = wr;
  //   _setLastUpdated();
  //   weatherChanged();
  // }

  // void _setLastUpdated() {
  //   lastUpdated = DateTime.now();
  // }

  // void weatherChanged() {
  //   _mapWeatherConditionToThemeAndColor(getWeatherCondition());
  // }

  // void markIsLoadingFlagAs(bool value) {
  //   isLoading = value;
  // }

  // void markHasErrorFlagAs(bool value) {
  //   hasError = value;
  // }

  // void saveCityInAppState(String requestedCity) {
  //   city = requestedCity;
  // }

  // WeatherCondition getWeatherCondition() {
  //   final Weather _weather = weatherResponse.weatherCollection.first;
  //   return _weather.mapConditionToWeatherCondition(_weather.condition);
  // }

  // void switchTemperatureUnit() {
  //   temperatureUnit == TemperatureUnit.celsius
  //       ? temperatureUnit = TemperatureUnit.fahrenheit
  //       : temperatureUnit = TemperatureUnit.celsius;
  // }

}
