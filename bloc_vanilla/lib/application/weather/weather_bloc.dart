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

@lazySingleton
class WeatherBloc implements Bloc {
  WeatherBloc(
    this._weatherFacade,
    this._themeBloc,
  ) {
    _weatherEventController.stream.listen(_mapEventToState);
  }

  final IWeatherFacade _weatherFacade;
  final ThemeBloc _themeBloc;

  final _weatherEntityStateController = BehaviorSubject<WeatherEntity>();
  StreamSink<WeatherEntity> get _inWeatherEntity =>
      _weatherEntityStateController.sink;
  Stream<WeatherEntity> get weatherEntity =>
      _weatherEntityStateController.stream;

  final _weatherEventController = StreamController<WeatherEvent>();
  Sink<WeatherEvent> get weatherEventSink => _weatherEventController.sink;

  Future<void> _mapEventToState(WeatherEvent event) async {
    if (event is FetchWeather) {
      await _fetchWeatherForLocation(location: event.location);
    }
    if (event is RefreshWeather) {
      await _refreshWeather(location: event.location);
    }
  }

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

  WeatherCondition getWeatherCondition({WeatherResponse weatherResponse}) {
    final Weather _weather = weatherResponse.weatherCollection.first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  @override
  void dispose() {
    _weatherEventController.close();
    _weatherEntityStateController.close();
  }
}
