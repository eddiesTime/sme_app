import 'package:cnp/theme_model.dart';

import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

class WeatherModel extends ChangeNotifier {
  final ThemeModel _themeModel;
  final WeatherRepository _weatherRepository;

  WeatherResponse _weatherResponse;
  bool _isLoading = false;
  String _city = '';
  bool _hasError = false;
  DateTime _lastUpdated;

  WeatherModel(this._themeModel, this._weatherRepository);

  set weather(WeatherResponse wr) {
    _weatherResponse = wr;
    _setLastUpdated();
    weatherChanged();
  }

  WeatherResponse get weather => _weatherResponse;

  set isLoading(bool value) {
    _isLoading = value;
  }

  bool get isLoading => _isLoading;

  set city(String city) {
    _city = city;
  }

  String get city => _city;

  set hasError(bool value) {
    _hasError = value;
  }

  bool get hasError => _hasError;

  void _setLastUpdated() {
    _lastUpdated = DateTime.now();
  }

  DateTime get lastUpdated => _lastUpdated;

  void weatherChanged() {
    final WeatherCondition condition = getWeatherCondition();
    _themeModel.mapWeatherCondition(condition);
  }

  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherResponse.weatherCollection.first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  Future<void> refreshWeather() async {
    try {
      final WeatherResponse _wr =
          await _weatherRepository.getWeatherFor(city: _city);
      _weatherResponse = _wr;
      _setLastUpdated();
      _hasError = false;
      notifyListeners();
      weatherChanged();
    } catch (err) {
      _hasError = true;
      notifyListeners();
    }
  }

  void fetchWeather(String city) async {
    _isLoading = true;
    _weatherResponse = null;
    notifyListeners();

    try {
      _city = city;
      final WeatherResponse _wr =
          await _weatherRepository.getWeatherFor(city: _city);
      _weatherResponse = _wr;
      _setLastUpdated();
      _hasError = false;
      _isLoading = false;
      notifyListeners();
      weatherChanged();
    } catch (err) {
      _isLoading = false;
      _hasError = true;
      notifyListeners();
    }
  }
}
