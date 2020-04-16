import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/model/enums/enum_weather_conditions.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  ThemeStore() {
    theme = ThemeData.light();
    color = Colors.lightBlue;
  }

  @observable
  ThemeData theme;
  @observable
  MaterialColor color;

  @action
  void mapWeatherConditionToTheme(WeatherCondition condition) {
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
