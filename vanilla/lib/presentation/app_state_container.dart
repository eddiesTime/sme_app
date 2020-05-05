import 'package:flutter/material.dart';
import 'package:vanilla/application/app_state.dart';
import 'package:vanilla/injection.dart';
import 'package:vanilla/presentation/vanilla_app.dart';

/// Is a `Stateful Widget` that hold a reference to [AppState]
/// and methods to manipulate the data in [appState].
///
/// The data manipulation triggers a rebuild of its [children].
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

  /// Refreshes the weather data by making a new API call for the given [location]
  /// by calling [appState.fetchWeather(location: location)].
  ///
  /// When a response from the API is received the method signals
  /// the widget to trigger an update of the UI.
  Future<void> refreshWeatherData({@required String location}) async {
    await appState.fetchWeather(location: location);
    setState(() {});
  }

  /// Loads the weather data by calling [appState.fetchWeather(location: location)].
  ///
  /// Signals the UI to display a loading indicator by calling
  /// [appState.indicateLoading()].
  Future<void> fetchWeatherForLocation({@required String location}) async {
    appState.indicateLoading();
    setState(() {});
    await appState.fetchWeather(location: location);
    setState(() {});
  }

  /// Switches the temperature unit from celcius to fahrenheit by calling [appState.toggleTemperatureUnit()].
  void toggleTemperatureUnit() {
    setState(() {
      appState.toggleTemperatureUnit();
    });
  }
}
