import 'package:flutter/material.dart';
import 'package:vanilla/application/app_state.dart';
import 'package:vanilla/presentation/weather/pages/weather_page.dart';

class VanillaApp extends StatelessWidget {
  final AppState appState;
  final Function toggleTemperatureUnit;
  final Function fetchWeatherForLocation;
  final Future<void> Function({@required String location}) refreshWeatherData;

  const VanillaApp({
    @required this.appState,
    @required this.toggleTemperatureUnit,
    @required this.fetchWeatherForLocation,
    @required this.refreshWeatherData,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: appState.themeEntity.themeData,
        home: WeatherPage(
          appState,
          toggleTemperatureUnit,
          fetchWeatherForLocation,
          refreshWeatherData,
        ));
  }
}
