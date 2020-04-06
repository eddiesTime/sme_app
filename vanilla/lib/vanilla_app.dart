import 'package:flutter/material.dart';
import 'package:vanilla/model/models.dart' as model;
import 'package:vanilla/weather_repository.dart';
import 'package:vanilla/pages/pages.dart';

class VanillaApp extends StatefulWidget {
  // This widget is the root of your application.
  final WeatherRepository weatherRepository;
  VanillaApp({@required WeatherRepository this.weatherRepository});
  @override
  _VanillaAppState createState() => _VanillaAppState();
}

class _VanillaAppState extends State<VanillaApp> {
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
