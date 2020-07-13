import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// This repository provides methods to access data from [MetaWeather](https://www.metaweather.com/).
///
/// If you want to request weather data
/// use the method [getWeatherFor(String city)].
///
/// Example:
/// ```dart
///   await weatherRepository.getWeatherFor(city: 'London');
/// ```
class WeatherRepository {
  /// [baseUrl] holds a reference to MetaWeather's API.
  static const baseUrl = 'https://www.metaweather.com';

  /// Returns a `Location` for the requested [city].
  Future<Location> fetchLocationWithQuery({@required String city}) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await http.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for $city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return Location.fromJson(locationJson.first);
  }

  /// Returns a `Location` for the given [lattitude] and [longitude].
  Future<Location> fetchLocationWithLattLong(
      {@required double latt, @required double long}) async {
    final locationUrl = '$baseUrl/api/location/search/?lattlong=$latt,$long';
    final locationResponse = await http.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for $latt,$long');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return Location.fromJson(locationJson.first);
  }

  /// Returns a `WeatherResponse` for a [Location] by using [location.woeId].
  ///
  /// Throws an [Exception] when the server response code is **not** 200.
  Future<WeatherResponse> fetchWeatherResponseForLocation(
      {@required Location location}) async {
    final weatherUrl = '$baseUrl/api/location/${location.woeId}';
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    return WeatherResponse.fromJson(weatherJson);
  }

  /// Returns a `WeatherResponse` for a `Location` with a query.
  ///
  /// Use this function when you want to request weather data with a query.
  Future<WeatherResponse> getWeatherWithQuery({@required String city}) async {
    final _location = await fetchLocationWithQuery(city: city);
    final _weatherResponse =
        await fetchWeatherResponseForLocation(location: _location);
    return _weatherResponse;
  }

  /// Returns a `WeatherResponse` for a `Location` with a query.
  ///
  /// Use this function when you want to request weather data with a query.
  Future<WeatherResponse> getWeatherWithLattLong(
      {@required double latt, @required double long}) async {
    final _location = await fetchLocationWithLattLong(latt: latt, long: long);
    final _weatherResponse =
        await fetchWeatherResponseForLocation(location: _location);
    return _weatherResponse;
  }
}
