import 'package:flutter/material.dart';
import 'package:vanilla/application/app_state.dart';
import 'package:vanilla/injection.dart';
import 'package:vanilla/presentation/vanilla_app.dart';

class AppStateContainer extends StatefulWidget {
  @override
  _AppStateContainerState createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState appState = getIt<AppState>();

  @override
  Widget build(BuildContext context) {
    return VanillaApp(
      appState: appState,
      toggleTemperatureUnit: toggleTemperatureUnit,
      fetchWeatherForLocation: fetchWeatherForLocation,
      refreshWeatherData: refreshWeatherData,
    );
  }

  Future<void> refreshWeatherData({@required String location}) async {
    await appState.fetchWeather(location: location);
    setState(() {});
  }

  Future<void> fetchWeatherForLocation({@required String location}) async {
    appState.indicateLoading();
    setState(() {});
    await appState.fetchWeather(location: location);
    setState(() {});
  }

  void toggleTemperatureUnit() {
    setState(() {
      appState.toggleTemperatureUnit();
    });
  }
}
