import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Is an interface that specifies which methods are relevant to connect to the domain layer.
abstract class IWeatherFacade {
  /// Is an asynchronous method that returns `WeatherResponse` for a given [location].
  Future<WeatherResponse> getWeatherForLocation({@required String location});

  /// Is an asynchonous method that return an updated `WeatherResponse` for a given [location]
  /// by making another request.
  Future<WeatherResponse> refreshWeatherData({@required String location});

  /// Returns a `WeatherCondition` for a given [weather].
  WeatherCondition getWeatherConditionForWeather({@required Weather weather});
}
