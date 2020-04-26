import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_actions.freezed.dart';

@freezed
abstract class WeatherActions with _$WeatherActions {
  const factory WeatherActions.fetchWeatherAction({@required String location}) =
      FetchWeatherAction;
  const factory WeatherActions.weatherLoadedAction(
      {@required WeatherResponse weatherResponse}) = WeatherLoadedAction;
  const factory WeatherActions.weatherNotLoadedAction() =
      WeatherNotLoadedAction;
  const factory WeatherActions.setIsRefreshingAction() = SetIsRefreshingAction;
  const factory WeatherActions.refreshWeatherAction() = RefreshWeatherAction;
}
