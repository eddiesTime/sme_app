import 'package:flutter/material.dart';
import 'package:vanilla/model/models.dart';

class AppState {
  WeatherResponse weatherResponse;
  bool isLoading;
  TemperatureUnit temperatureUnit;
  ThemeData theme = ThemeData.light();
  MaterialColor color;
  String city;
  bool hasError;
  DateTime lastUpdated;

  AppState(
      {this.weatherResponse = null,
      this.isLoading = false,
      this.temperatureUnit = TemperatureUnit.celsius,
      this.color = Colors.lightBlue,
      this.city = '',
      this.hasError = false});

  void saveWeatherResponseInAppState(WeatherResponse wr) {
    weatherResponse = wr;
    _setLastUpdated();
    weatherChanged();
  }

  void _setLastUpdated() {
    lastUpdated = DateTime.now();
  }

  void weatherChanged() {
    _mapWeatherConditionToThemeAndColor(getWeatherCondition());
  }

  void markIsLoadingFlagAs(bool value) {
    isLoading = value;
  }

  void markHasErrorFlagAs(bool value) {
    hasError = value;
  }

  void saveCityInAppState(String requestedCity) {
    city = requestedCity;
  }

  WeatherCondition getWeatherCondition() {
    final Weather _weather = weatherResponse.weatherCollection.first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  void switchTemperatureUnit() {
    temperatureUnit == TemperatureUnit.celsius
        ? temperatureUnit = TemperatureUnit.fahrenheit
        : temperatureUnit = TemperatureUnit.celsius;
  }

  void _mapWeatherConditionToThemeAndColor(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        theme = ThemeData(
          primaryColor: Colors.orangeAccent,
        );
        color = Colors.yellow;
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        theme = ThemeData(
          primaryColor: Colors.lightBlueAccent,
        );
        color = Colors.lightBlue;
        break;
      case WeatherCondition.heavyCloud:
        theme = ThemeData(
          primaryColor: Colors.blueGrey,
        );
        color = Colors.grey;
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        theme = ThemeData(
          primaryColor: Colors.indigoAccent,
        );
        color = Colors.indigo;
        break;
      case WeatherCondition.thunderstorm:
        theme = ThemeData(
          primaryColor: Colors.deepPurpleAccent,
        );
        color = Colors.deepPurple;
        break;
      case WeatherCondition.unknown:
        theme = ThemeData.light();
        color = Colors.lightBlue;
        break;
    }
  }
}
