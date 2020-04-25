import 'dart:async';

import 'package:bloc_vanilla/application/bloc.dart';
import 'package:bloc_vanilla/domain/theme/theme_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'theme_event.dart';
part 'theme_bloc.freezed.dart';

@lazySingleton
class ThemeBloc implements Bloc {
  final _themeStateController = BehaviorSubject<ThemeEntity>();
  StreamSink<ThemeEntity> get _inThemeEntity => _themeStateController.sink;
  Stream<ThemeEntity> get themeEntity => _themeStateController.stream;

  final _themeEventController = StreamController<ThemeEvent>();

  Sink<ThemeEvent> get themeEventSink => _themeEventController.sink;

  ThemeBloc() {
    _inThemeEntity.add(ThemeEntity.initial());
    _themeEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ThemeEvent event) {
    if (event is WeatherChanged) {
      _updateThemeToMatchWeatherCondition(event.weatherCondition);
    }
  }

  void _updateThemeToMatchWeatherCondition(WeatherCondition condition) {
    ThemeEntity _themeEntity;
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
    _inThemeEntity.add(_themeEntity);
  }

  @override
  void dispose() {
    _themeEventController.close();
    _themeStateController.close();
  }
}
