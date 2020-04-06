import 'package:flutter/material.dart';
import 'package:inherited_widget/model/models.dart' as model;
import 'package:inherited_widget/weather_repository.dart';
import 'package:inherited_widget/pages/pages.dart';

class InheritedWidgetApp extends StatefulWidget {
  // This widget is the root of your application.
  final WeatherRepository weatherRepository;
  InheritedWidgetApp({@required WeatherRepository this.weatherRepository});
  @override
  _InheritedWidgetAppState createState() => _InheritedWidgetAppState();
}

class _InheritedWidgetAppState extends State<InheritedWidgetApp> {
  model.AppState appState = model.AppState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: appState.theme,
        home: WeatherPage(
            appState, toggleTemperatureUnit, fetchWeather, refreshWeather));
  }

  Future<void> refreshWeather() async {
    try {
      final model.WeatherResponse _weatherResponse =
          await widget.weatherRepository.getWeatherFor(city: appState.city);
      setState(() {
        appState.saveWeatherResponseInAppState(_weatherResponse);
        appState.markHasErrorFlagAs(false);
      });
    } catch (err) {
      setState(() {
        appState.markHasErrorFlagAs(true);
      });
    }
  }

  void fetchWeather(String city) async {
    setState(() {
      appState.markIsLoadingFlagAs(true);
      appState.weatherResponse = null;
    });
    try {
      appState.saveCityInAppState(city);
      final model.WeatherResponse _weatherResponse =
          await widget.weatherRepository.getWeatherFor(city: appState.city);
      setState(() {
        appState.saveWeatherResponseInAppState(_weatherResponse);
        appState.markHasErrorFlagAs(false);
        appState.markIsLoadingFlagAs(false);
      });
    } catch (err) {
      setState(() {
        appState.markIsLoadingFlagAs(false);
        appState.markHasErrorFlagAs(true);
      });
    }
  }

  void toggleTemperatureUnit(bool value) {
    setState(() {
      appState.switchTemperatureUnit();
    });
  }
}
