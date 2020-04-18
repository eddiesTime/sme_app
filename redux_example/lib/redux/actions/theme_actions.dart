import 'package:meta/meta.dart';
import 'package:redux_example/model/models.dart';

class SetThemeAction {
  SetThemeAction({@required this.weatherCondition});
  final WeatherCondition weatherCondition;
}
