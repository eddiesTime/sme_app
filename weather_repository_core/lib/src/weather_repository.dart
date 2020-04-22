import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class WeatherRepository {
  static const baseUrl = 'https://www.metaweather.com';

  Future<Location> fetchLocationFor({@required String city}) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await http.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for $city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return Location.fromJson(locationJson.first);
  }

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

  Future<WeatherResponse> getWeatherFor({@required String city}) async {
    final Location _location = await fetchLocationFor(city: city);
    final WeatherResponse _weatherResponse =
        await fetchWeatherResponseForLocation(location: _location);
    return _weatherResponse;
  }
}
