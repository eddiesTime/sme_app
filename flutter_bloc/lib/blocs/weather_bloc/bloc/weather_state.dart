part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherResponse weatherResponse;
  final DateTime lastUpdated;

  WeatherLoaded(
      {@required WeatherResponse this.weatherResponse,
      @required DateTime this.lastUpdated})
      : assert(weatherResponse != null),
        assert(lastUpdated != null);
}

class WeatherLoadingFailure extends WeatherState {}
