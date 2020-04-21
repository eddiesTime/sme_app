import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    return ThemeState(theme: ThemeData.light(), color: Colors.lightBlue);
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is WeatherChanged) {
      yield* _mapWeatherConditionToState(event.condition);
    }
  }

  Stream<ThemeState> _mapWeatherConditionToState(
      WeatherCondition condition) async* {
    ThemeData _theme;
    MaterialColor _color;

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
    yield ThemeState(theme: _theme, color: _color);
  }
}
