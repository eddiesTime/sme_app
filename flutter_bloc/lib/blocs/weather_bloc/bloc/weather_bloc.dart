import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/weather_repository.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepo;
  String _city;
  DateTime _lastUpdated;

  WeatherBloc({@required WeatherRepository this.weatherRepo})
      : assert(weatherRepo != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield* _mapFetchWeatherToState(event);
    }
    if (event is RefreshWeather) {
      yield* _mapRefreshWeatherToState();
    }
  }

  Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    yield WeatherLoading();
    try {
      final WeatherResponse _weatherResponse =
          await weatherRepo.getWeatherFor(city: event.city);
      _city = event.city;
      _lastUpdated = DateTime.now();
      yield WeatherLoaded(
          weatherResponse: _weatherResponse, lastUpdated: _lastUpdated);
    } catch (err) {
      yield WeatherLoadingFailure();
    }
  }

  Stream<WeatherState> _mapRefreshWeatherToState() async* {
    try {
      final WeatherResponse _weatherResponse =
          await weatherRepo.getWeatherFor(city: _city);
      _lastUpdated = DateTime.now();
      yield WeatherLoaded(
          weatherResponse: _weatherResponse, lastUpdated: _lastUpdated);
    } catch (err) {
      yield WeatherLoadingFailure();
    }
  }
}
