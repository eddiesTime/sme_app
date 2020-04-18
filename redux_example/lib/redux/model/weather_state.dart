import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:redux_example/model/weather_response/weather_response.dart';

@immutable
class WeatherState {
  final String city;
  final DateTime lastUpdated;
  final WeatherResponse weatherResponse;
  final bool hasError;
  final bool isRefreshing;

  const WeatherState({
    @required this.city,
    @required this.lastUpdated,
    @required this.weatherResponse,
    this.hasError = false,
    this.isRefreshing = false,
  });

  WeatherState copyWith({
    String city,
    DateTime lastUpdated,
    WeatherResponse weatherResponse,
  }) {
    return WeatherState(
      city: city ?? this.city,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      weatherResponse: weatherResponse ?? this.weatherResponse,
    );
  }

  dynamic toJson() => {
        'city': city,
        'lastUpdated': lastUpdated,
        'weatherResponse': weatherResponse
      };

  @override
  String toString() {
    return 'WeatherState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
