import 'dart:async';

import 'package:bloc_vanilla/application/bloc.dart';
import 'package:bloc_vanilla/application/theme/theme_bloc.dart';
import 'package:bloc_vanilla/domain/weather/i_weather_facade.dart';
import 'package:bloc_vanilla/domain/weather/weather_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/subjects.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_event.dart';
part 'weather_bloc.freezed.dart';

/// A business logic component to handle weather related logic in the application.
@lazySingleton
class WeatherBloc implements Bloc {
  WeatherBloc(
    this._weatherFacade,
    this._themeBloc,
  ) {
    // Start to listen to the weather event stream to be able to react to events.
    _weatherEventController.stream.listen(_mapEventToState);
  }

  final IWeatherFacade _weatherFacade;
  final ThemeBloc _themeBloc;

  /// Uses the `BehaviourSubject` from `rxdart` to create an advanced [StreamController].
  final _weatherEntityStateController = BehaviorSubject<WeatherEntity>();

  /// A reference to the `stream sink` of the `BehaviourSubject`.
  StreamSink<WeatherEntity> get _inWeatherEntity =>
      _weatherEntityStateController.sink;

  /// A reference to the `stream` of the `BehaviourSubject`.
  Stream<WeatherEntity> get weatherEntity =>
      _weatherEntityStateController.stream;

  /// Creates an instance of a `weather event Streamcontroller`.
  final _weatherEventController = StreamController<WeatherEvent>();

  /// A reference to the `event StreamController's sink`.
  Sink<WeatherEvent> get weatherEventSink => _weatherEventController.sink;

  /// Map the asynchronous `event` to an asynchronous `reaction` to the event.
  Future<void> _mapEventToState(WeatherEvent event) async {
    if (event is FetchWeather) {
      await _fetchWeatherForLocation(location: event.location);
    }
    if (event is RefreshWeather) {
      await _refreshWeather(location: event.location);
    }
  }

  /// An asynchronous method that fetches weather data and adds a [WeatherEntity] to the BehaviourSubject's [stream] when successful.
  ///
  /// Adds a [WeatherEntity.loadingFailure()] to the BehaviourSubject's [stream] when an error has occured.
  ///
  /// Adds a [WeatherChanged] event to the `ThemeBloc event sink`.
  Future<void> _fetchWeatherForLocation({String location}) async {
    _inWeatherEntity.add(WeatherEntity.loading());
    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      _inWeatherEntity.add(
        WeatherEntity(
          weatherResponse: some(_wr),
          city: location,
          hasError: false,
          lastUpdated: some(DateTime.now()),
          isLoading: false,
        ),
      );
      _themeBloc.themeEventSink.add(
        WeatherChanged(
          getWeatherCondition(weatherResponse: _wr),
        ),
      );
    } catch (e) {
      _inWeatherEntity.add(WeatherEntity.loadingFailure());
    }
  }

  /// An asynchronous method that refreshes weather data and adds a [WeatherEntity] to the BehaviourSubject's [stream] when successful.
  ///
  /// Adds a [WeatherEntity.loadingFailure()] to the BehaviourSubject's [stream] when an error has occured.
  ///
  /// Adds a [WeatherChanged] event to the `ThemeBloc event sink`.
  Future<void> _refreshWeather({String location}) async {
    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      _inWeatherEntity.add(
        WeatherEntity(
            weatherResponse: some(_wr),
            city: location,
            hasError: false,
            lastUpdated: some(DateTime.now()),
            isLoading: false),
      );
      _themeBloc.themeEventSink.add(
        WeatherChanged(
          getWeatherCondition(weatherResponse: _wr),
        ),
      );
    } catch (e) {
      _inWeatherEntity.add(WeatherEntity.loadingFailure());
    }
  }

  /// Returns the [WeatherCondition] for a given [WeatherResponse].
  WeatherCondition getWeatherCondition({WeatherResponse weatherResponse}) {
    final Weather _weather = weatherResponse.weatherCollection.first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  /// Closes all [StreamController] inside the weather bloc when it gets disposed.
  @override
  void dispose() {
    _weatherEventController.close();
    _weatherEntityStateController.close();
  }
}
