import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class ThemeStore {
  ThemeStore() {
    _theme = ThemeData.light();
    _color = Colors.lightBlue;
  }

  ThemeData _theme;
  ThemeData get theme => _theme;
  MaterialColor _color;
  MaterialColor get color => _color;

  void mapWeatherConditionToTheme(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        _theme = ThemeData(
          primaryColor: Colors.orangeAccent,
        );
        _color = Colors.yellow;
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        _theme = ThemeData(
          primaryColor: Colors.lightBlueAccent,
        );
        _color = Colors.lightBlue;
        break;
      case WeatherCondition.heavyCloud:
        _theme = ThemeData(
          primaryColor: Colors.blueGrey,
        );
        _color = Colors.grey;
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        _theme = ThemeData(
          primaryColor: Colors.indigoAccent,
        );
        _color = Colors.indigo;
        break;
      case WeatherCondition.thunderstorm:
        _theme = ThemeData(
          primaryColor: Colors.deepPurpleAccent,
        );
        _color = Colors.deepPurple;
        break;
      case WeatherCondition.unknown:
        _theme = ThemeData.light();
        _color = Colors.lightBlue;
        break;
    }
  }
}
