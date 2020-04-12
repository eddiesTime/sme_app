import 'package:cnp/theme_model.dart';
import 'package:cnp/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:cnp/model/models.dart' as model;

class WeatherModel extends ChangeNotifier {
  final ThemeModel _themeModel;
  final WeatherRepository _weatherRepository;

  model.WeatherResponse _weatherResponse;
  bool _isLoading = false;
  String _city = '';
  bool _hasError = false;
  DateTime _lastUpdated;

  WeatherModel(this._themeModel, this._weatherRepository);

  set weather(model.WeatherResponse wr) {
    _weatherResponse = wr;
    _setLastUpdated();
    weatherChanged();
  }

  model.WeatherResponse get weather => _weatherResponse;

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
    final model.WeatherCondition condition = getWeatherCondition();
    _themeModel.mapWeatherCondition(condition);
  }

  model.WeatherCondition getWeatherCondition() {
    final model.Weather _weather = _weatherResponse.weatherCollection.first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  Future<void> refreshWeather() async {
    try {
      final model.WeatherResponse _wr =
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
      final model.WeatherResponse _wr =
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
