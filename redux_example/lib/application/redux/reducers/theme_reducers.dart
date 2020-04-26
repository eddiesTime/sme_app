import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/actions/weather_actions.dart';
import 'package:redux_example/application/redux/model/theme_state.dart';
import 'package:redux_example/domain/theme/theme_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

final Reducer<ThemeState> themeReducer = combineReducers<ThemeState>(
    [TypedReducer<ThemeState, WeatherLoadedAction>(_setTheme)]);

ThemeState _setTheme(ThemeState themeState, WeatherLoadedAction action) {
  final WeatherCondition _weatherCondition = action
      .weatherResponse.weatherCollection.first
      .mapConditionToWeatherCondition(
          action.weatherResponse.weatherCollection.first.condition);
  ThemeEntity _themeEntity;
  switch (_weatherCondition) {
    case WeatherCondition.clear:
    case WeatherCondition.lightCloud:
      _themeEntity = ThemeEntity(
        themeData: ThemeData(
          primaryColor: Colors.orangeAccent,
        ),
        materialColor: Colors.yellow,
      );
      break;
    case WeatherCondition.hail:
    case WeatherCondition.snow:
    case WeatherCondition.sleet:
      _themeEntity = ThemeEntity(
        themeData: ThemeData(
          primaryColor: Colors.lightBlueAccent,
        ),
        materialColor: Colors.lightBlue,
      );
      break;
    case WeatherCondition.heavyCloud:
      _themeEntity = ThemeEntity(
        themeData: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        materialColor: Colors.grey,
      );
      break;
    case WeatherCondition.heavyRain:
    case WeatherCondition.lightRain:
    case WeatherCondition.showers:
      _themeEntity = ThemeEntity(
        themeData: ThemeData(
          primaryColor: Colors.indigoAccent,
        ),
        materialColor: Colors.indigo,
      );
      break;
    case WeatherCondition.thunderstorm:
      _themeEntity = ThemeEntity(
        themeData: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
        ),
        materialColor: Colors.deepPurple,
      );
      break;
    case WeatherCondition.unknown:
      _themeEntity = ThemeEntity.initial();
  }
  return ThemeState(themeEntity: _themeEntity);
}
