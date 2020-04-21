import 'package:meta/meta.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

abstract class ThemeEvent {}

class WeatherChanged extends ThemeEvent {
  WeatherChanged({@required WeatherCondition this.condition});

  final WeatherCondition condition;
}
