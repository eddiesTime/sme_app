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

/// A business logic component to handle weather related logic in the application.
@lazySingleton
class ThemeBloc implements Bloc {
  /// Uses the `BehaviourSubject` from `rxdart` to create an advanced [StreamController].
  final _themeStateController = BehaviorSubject<ThemeEntity>();

  /// A reference to the `stream sink` of the `BehaviourSubject`.
  StreamSink<ThemeEntity> get _inThemeEntity => _themeStateController.sink;

  /// A reference to the `stream` of the `BehaviourSubject`.
  Stream<ThemeEntity> get themeEntity => _themeStateController.stream;

  /// Creates an instance of a `theme event StreamController`.
  final _themeEventController = StreamController<ThemeEvent>();

  /// A reference to the `theme StreamController's sink`.
  Sink<ThemeEvent> get themeEventSink => _themeEventController.sink;

  ThemeBloc() {
    // Add an initial ThemeEntity to the StreamController's stream.
    _inThemeEntity.add(ThemeEntity.initial());
    // Start to listen to the weather event stream to be able to react to events.
    _themeEventController.stream.listen(_mapEventToState);
  }

  /// Map the `event` to a `reaction`.
  void _mapEventToState(ThemeEvent event) {
    if (event is WeatherChanged) {
      _updateThemeToMatchWeatherCondition(event.weatherCondition);
    }
  }

  /// Triggers the process to update the theme related to the `WeatherCondition`.
  ///
  /// Adds a [ThemeEntity] to the BehaviourSubject's [stream].
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

  /// Closes all [StreamController] inside the theme bloc when it gets disposed.
  @override
  void dispose() {
    _themeEventController.close();
    _themeStateController.close();
  }
}
