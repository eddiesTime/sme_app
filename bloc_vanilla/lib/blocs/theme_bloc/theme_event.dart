import 'package:bloc_vanilla/model/enums/enum_weather_conditions.dart';
import 'package:meta/meta.dart';

abstract class ThemeEvent {}

class WeatherChanged extends ThemeEvent {
  WeatherChanged({@required WeatherCondition this.condition});

  final WeatherCondition condition;
}
