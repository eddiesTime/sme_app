part of 'weather_bloc.dart';

/// An interface that specifies weather events.
@freezed
abstract class WeatherEvent with _$WeatherEvent {
  /// Specifies a weather event to fetch weather data for a given [location].
  const factory WeatherEvent.fetchWeatherForLocation(String location) =
      FetchWeather;

  /// Specifies a weather event to refresh weather data for a given [location].
  const factory WeatherEvent.refreshWeatherForLocation(String location) =
      RefreshWeather;
}
