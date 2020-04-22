import 'dart:async';

import 'package:bloc_vanilla/blocs/theme_bloc/theme_event.dart';
import 'package:bloc_vanilla/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_vanilla/blocs/weather_bloc/weather_event.dart';
import 'package:bloc_vanilla/blocs/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

class WeatherBloc implements Bloc {
  WeatherBloc({
    @required WeatherRepository this.weatherRepo,
    @required ThemeBloc this.themeBloc,
  }) {
    _weatherEventController.stream.listen(_mapEventToState);
  }

  final WeatherRepository weatherRepo;
  final ThemeBloc themeBloc;
  WeatherResponse _weatherResponse;
  String _city;
  DateTime _lastUpdated;
  bool _isLoading = false;

  DateTime get lastUpdated => _lastUpdated;
  bool get isLoading => _isLoading;

  final _weatherResponseStateController =
      StreamController<WeatherResponse>.broadcast();
  StreamSink<WeatherResponse> get _inWeatherResponse =>
      _weatherResponseStateController.sink;
  Stream<WeatherResponse> get weatherResponse =>
      _weatherResponseStateController.stream;

  final _weatherEventController = StreamController<WeatherEvent>();
  Sink<WeatherEvent> get WeatherEventSink => _weatherEventController.sink;

  void _mapEventToState(WeatherEvent event) async {
    if (event is FetchWeather) {
      _fetchWeatherFor(event.city);
    }
  }

  void _fetchWeatherFor(String city) async {
    _weatherResponse = null;
    _isLoading = true;
    _inWeatherResponse.add(_weatherResponse);
    _weatherResponse = await weatherRepo.getWeatherFor(city: city);
    _city = city;
    _lastUpdated = DateTime.now();
    _inWeatherResponse.add(_weatherResponse);
    themeBloc.themeEventSink
        .add(WeatherChanged(condition: getWeatherCondition()));
    _isLoading = false;
  }

  Future<void> refreshWeather() async {
    _weatherResponse = await weatherRepo.getWeatherFor(city: _city);
    _lastUpdated = DateTime.now();
    _inWeatherResponse.add(_weatherResponse);
  }

  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherResponse.weatherCollection.first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  @override
  void dispose() {
    _weatherEventController.close();
    _weatherResponseStateController.close();
  }
}
