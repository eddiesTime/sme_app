import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_actions.freezed.dart';

@freezed
abstract class WeatherActions with _$WeatherActions {
  /// A `WeatherAction` that signals Redux to fetch weather.
  const factory WeatherActions.fetchWeatherAction({@required String location}) =
      FetchWeatherAction;

  /// A `WeatherAction` that signals Redux that the weather has been loaded.
  const factory WeatherActions.weatherLoadedAction(
      {@required WeatherResponse weatherResponse}) = WeatherLoadedAction;

  /// A `WeatherAction` that signals Redux that the weather could not be loaded.
  const factory WeatherActions.weatherNotLoadedAction() =
      WeatherNotLoadedAction;

  /// A `WeatherAction` that signals Redux that the weather data is refreshing.
  const factory WeatherActions.setIsRefreshingAction() = SetIsRefreshingAction;

  /// A `WeatherAction` that signals Redux to refresh the weather data.
  const factory WeatherActions.refreshWeatherAction() = RefreshWeatherAction;
}
