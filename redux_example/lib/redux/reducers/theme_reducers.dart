import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/model/models.dart';
import 'package:redux_example/redux/actions/theme_actions.dart';
import 'package:redux_example/redux/actions/weather_actions.dart';
import 'package:redux_example/redux/model/models.dart';

final themeReducer = combineReducers<ThemeState>(
    [TypedReducer<ThemeState, WeatherLoadedAction>(_setTheme)]);

ThemeState _setTheme(ThemeState themeState, WeatherLoadedAction action) {
  final WeatherCondition _weatherCondition = action
      .weatherResponse.weatherCollection.first
      .mapConditionToWeatherCondition(
          action.weatherResponse.weatherCollection.first.condition);
  ThemeData _theme;
  MaterialColor _color;
  switch (_weatherCondition) {
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
  return ThemeState(theme: _theme, color: _color);
}
