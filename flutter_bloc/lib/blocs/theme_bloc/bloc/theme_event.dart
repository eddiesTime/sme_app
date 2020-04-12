part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class WeatherChanged extends ThemeEvent {
  WeatherChanged({@required WeatherCondition this.condition});

  final WeatherCondition condition;
}
