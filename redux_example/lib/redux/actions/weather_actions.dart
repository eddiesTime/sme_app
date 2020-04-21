import 'package:meta/meta.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class FetchWeatherAction {
  FetchWeatherAction({@required this.city});

  final String city;
}

class SetCityAction {
  final String city;
  SetCityAction({@required this.city});
}

class SetLastUpdatedAction {}

class WeatherLoadedAction {
  final WeatherResponse weatherResponse;
  WeatherLoadedAction(this.weatherResponse);

  @override
  String toString() {
    return 'WeatherLoadedAction {weatherResponse: $weatherResponse}';
  }
}

class SetIsRefreshingAction {}

class LoadWeatherAction {}

class WeatherNotLoadedAction {}

class RefreshWeatherAction {}

class WeatherChangedAction {
  final WeatherCondition weatherCondition;
  WeatherChangedAction(this.weatherCondition);

  @override
  String toString() {
    return 'WeatherChangedAction {weatherCondition: $weatherCondition}';
  }
}
