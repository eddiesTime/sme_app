import 'package:cnp/domain/theme/theme_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Extends [ChangeNotifier] to be used by [ChangeNotifierProvider].
///
/// Handles theme data related logic.
@lazySingleton
class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier(this._themeEntity);
  ThemeEntity _themeEntity;

  /// Returns the [ThemeData] of the [ThemeEntity].
  ThemeData get theme => _themeEntity.themeData;

  /// Returns the [MaterialColor] of the [ThemeEntity].
  MaterialColor get color => _themeEntity.materialColor;

  /// Updates the local [ThemeEntity] to match the given [WeatherContition].
  ///
  /// Notifies its listeners after the [ThemeEntity] has been updated.
  void mapWeatherCondition({WeatherCondition condition}) {
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
    notifyListeners();
  }
}
