part of 'weather_bloc.dart';

/// An interface to specify weather events.
@freezed
abstract class WeatherEvent with _$WeatherEvent {
  /// Specifies a weather event that fetches weather data for a given [location].
  const factory WeatherEvent.fetchWeatherForLocation({String location}) =
      FetchWeather;

  /// Specifies a weather event that refreshes weather data for a given [location].
  const factory WeatherEvent.refreshWeatherForLocation({String location}) =
      RefreshWeather;
}
