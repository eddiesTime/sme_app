import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/domain/theme/theme_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'theme_store.g.dart';

/// Used in MobX to manage the state of theme related data.
@lazySingleton
class ThemeStore extends _ThemeStore with _$ThemeStore {
  ThemeStore({@required ThemeEntity themeEntity}) : super(themeEntity);
}

abstract class _ThemeStore with Store {
  _ThemeStore(this.themeEntity);

  /// A MobX observable for `ThemeEntity`.
  @observable
  ThemeEntity themeEntity;

  /// A MobX computed value that computes the current `theme` provided by
  /// the theme entity.
  @computed
  ThemeData get theme {
    return themeEntity.themeData;
  }

  /// A MobX action that signals MobX to update the theme to match the `WeatherCondition` [condition].
  @action
  void mapWeatherConditionToTheme(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        themeEntity = ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.orangeAccent,
          ),
          materialColor: Colors.yellow,
        );
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        themeEntity = ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          materialColor: Colors.lightBlue,
        );
        break;
      case WeatherCondition.heavyCloud:
        themeEntity = ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.blueGrey,
          ),
          materialColor: Colors.grey,
        );
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        themeEntity = ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          materialColor: Colors.indigo,
        );
        break;
      case WeatherCondition.thunderstorm:
        themeEntity = ThemeEntity(
          themeData: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
          ),
          materialColor: Colors.deepPurple,
        );
        break;
      case WeatherCondition.unknown:
        themeEntity = ThemeEntity.initial();
    }
  }
}
