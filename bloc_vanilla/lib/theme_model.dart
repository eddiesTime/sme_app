import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _theme = ThemeData.light();
  MaterialColor _color = Colors.lightBlue;

  void setTheme(ThemeData td) {
    _theme = td;
  }

  ThemeData get theme => _theme;

  void setColor(MaterialColor c) {
    _color = c;
  }

  MaterialColor get color => _color;

  void mapWeatherCondition(WeatherCondition condition) {
    ThemeData theme;
    MaterialColor color;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        theme = ThemeData(
          primaryColor: Colors.orangeAccent,
        );
        color = Colors.yellow;
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        theme = ThemeData(
          primaryColor: Colors.lightBlueAccent,
        );
        color = Colors.lightBlue;
        break;
      case WeatherCondition.heavyCloud:
        theme = ThemeData(
          primaryColor: Colors.blueGrey,
        );
        color = Colors.grey;
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        theme = ThemeData(
          primaryColor: Colors.indigoAccent,
        );
        color = Colors.indigo;
        break;
      case WeatherCondition.thunderstorm:
        theme = ThemeData(
          primaryColor: Colors.deepPurpleAccent,
        );
        color = Colors.deepPurple;
        break;
      case WeatherCondition.unknown:
        theme = ThemeData.light();
        color = Colors.lightBlue;
        break;
    }
    setTheme(theme);
    setColor(color);
    notifyListeners();
  }
}
