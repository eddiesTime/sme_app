part of 'weather_bloc.dart';

@freezed
abstract class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.fetchWeatherForLocation({String location}) =
      FetchWeather;
  const factory WeatherEvent.refreshWeatherForLocation({String location}) =
      RefreshWeather;
}
