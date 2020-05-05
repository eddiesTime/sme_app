import 'package:flutter/material.dart';
import 'package:states_rebuilder_example/domain/theme/theme_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Holds a reference to `ThemeEntity`.
///
/// It is used by the reative model in by states_provider.
class ThemeStore {
  ThemeStore(this._themeEntity);

  ThemeEntity _themeEntity;
  ThemeEntity get themeEntity => _themeEntity;

  /// Sets the `ThemeEntity` to match the given `WeatherCondition`.
  ///
  /// For example: `condition == WeatherCondition.clear` returns a themeEntity
  /// which gives the theme a warm sunny touch.
  void mapWeatherConditionToTheme(WeatherCondition condition) {
    switch (condition) {
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
  }
}
