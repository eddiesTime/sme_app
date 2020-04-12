import 'package:flutter/material.dart';
import 'package:inherited_widget/app_state.dart';
import 'package:inherited_widget/inherited_app_state_container.dart';
import 'package:inherited_widget/model/models.dart' as model;
import 'package:inherited_widget/weather_repository.dart';

class AppStateContainer extends StatefulWidget {
  final AppState appState;
  final Widget child;
  final WeatherRepository weatherRepository;

  AppStateContainer(
      {@required this.child, this.appState, this.weatherRepository});

  static AppStateContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedAppStateContainer>()
        .data;
  }

  @override
  State<StatefulWidget> createState() => AppStateContainerState();
}

class AppStateContainerState extends State<AppStateContainer> {
  AppState appState;

  @override
  void initState() {
    if (widget.appState != null) {
      appState = widget.appState;
    } else {
      appState = AppState();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedAppStateContainer(
      data: this,
      child: widget.child,
    );
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
    print("fetchWeather");
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
