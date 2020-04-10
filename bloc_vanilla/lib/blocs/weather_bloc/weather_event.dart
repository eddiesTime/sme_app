import 'package:meta/meta.dart';

abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  FetchWeather({@required String this.city});
  final String city;
}

class RefreshWeather extends WeatherEvent {}
