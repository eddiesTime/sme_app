import 'dart:async';
import 'package:bloc_vanilla/blocs/bloc.dart';
import 'package:flutter/material.dart';

import 'package:bloc_vanilla/blocs/theme_bloc/theme_event.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class ThemeBloc implements Bloc {
  ThemeData _theme = ThemeData.light();
  MaterialColor _color = Colors.lightBlue;

  final _themeStateController = StreamController<ThemeData>();
  StreamSink<ThemeData> get _inTheme => _themeStateController.sink;
  Stream<ThemeData> get theme => _themeStateController.stream;

  final _themeEventController = StreamController<ThemeEvent>();

  Sink<ThemeEvent> get themeEventSink => _themeEventController.sink;

  MaterialColor get color => _color;

  ThemeBloc() {
    _inTheme.add(_theme);
    _themeEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ThemeEvent event) {
    if (event is WeatherChanged) {
      _mapWeatherCondition(event.condition);
    }
    _inTheme.add(_theme);
  }

  void _mapWeatherCondition(WeatherCondition condition) {
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

  @override
  void dispose() {
    _themeEventController.close();
    _themeStateController.close();
  }
}
