import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'theme_entity.freezed.dart';

/// Is a domain specific model which holds the apps theme relevant data.
@injectable
@freezed
abstract class ThemeEntity implements _$ThemeEntity {
  const factory ThemeEntity(
      {@required ThemeData themeData,
      @required MaterialColor materialColor}) = _ThemeEntity;
  const ThemeEntity._();

  /// Is a `ThemeEntity` which represents the inital state.
  @factoryMethod
  factory ThemeEntity.initial() => ThemeEntity(
        themeData: ThemeData.light(),
        materialColor: Colors.lightBlue,
      );

  /// Returns a `ThemeEntity` for a given `WeatherCondition`.
  ///
  /// For example: `condition == WeatherCondition.clear` returns a themeEntity
  /// which gives the theme a warm sunny touch.
  ThemeEntity updateThemeToMatchWeatherCondition({
    @required WeatherCondition condition,
  }) {
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        return ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.orangeAccent,
          ),
          materialColor: Colors.yellow,
        );
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        return ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          materialColor: Colors.lightBlue,
        );
      case WeatherCondition.heavyCloud:
        return ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.blueGrey,
          ),
          materialColor: Colors.grey,
        );
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        return ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          materialColor: Colors.indigo,
        );
      case WeatherCondition.thunderstorm:
        return ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
          ),
          materialColor: Colors.deepPurple,
        );
      case WeatherCondition.unknown:
        return ThemeEntity.initial();
    }
    return ThemeEntity.initial();
  }
}
