import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

abstract class IWeatherFacade {
  Future<WeatherResponse> getWeatherForLocation({@required String location});
  Future<WeatherResponse> refreshWeatherData({@required String location});
  WeatherCondition getWeatherConditionForWeather({@required Weather weather});
}
