import 'package:meta/meta.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class SetThemeAction {
  SetThemeAction({@required this.weatherCondition});
  final WeatherCondition weatherCondition;
}
