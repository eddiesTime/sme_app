import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/domain/weather/i_weather_facade.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherFacade _weatherFacade;

  WeatherBloc(this._weatherFacade);

  @override
  WeatherState get initialState => const WeatherState.initial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield* _mapFetchWeatherToState(event);
    }
    if (event is RefreshWeather) {
      yield* _mapRefreshWeatherToState(event);
    }
  }

  Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    yield const WeatherState.loading();
    try {
      final WeatherResponse _weatherResponse =
          await _weatherFacade.getWeatherForLocation(location: event.location);
      yield WeatherState.loaded(WeatherEntity(
          weatherResponse: some(_weatherResponse),
          city: event.location,
          lastUpdated: some(DateTime.now())));
    } catch (err) {
      yield const WeatherState.loadingFailure();
    }
  }

  Stream<WeatherState> _mapRefreshWeatherToState(RefreshWeather event) async* {
    try {
      final WeatherResponse _weatherResponse =
          await _weatherFacade.getWeatherForLocation(location: event.location);
      yield WeatherState.loaded(WeatherEntity(
          weatherResponse: some(_weatherResponse),
          city: event.location,
          lastUpdated: some(DateTime.now())));
    } catch (err) {
      yield const WeatherState.loadingFailure();
    }
  }
}
