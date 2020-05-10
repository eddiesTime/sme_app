import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:inherited_widget/application/app_state.dart';
import 'package:inherited_widget/application/inherited_app_state_container.dart';
import 'package:inherited_widget/injection.dart';

/// This widget is a wrapper for an `Inherited Widget` in this case [InheritedAppStateContainer].
///
/// It holds a reference to [AppState]
/// and methods to manipulate the data in [appState].
class AppStateContainer extends StatefulWidget {
  final AppState appState;
  final Widget child;

  const AppStateContainer({
    @required this.child,
    this.appState,
  });

  /// Returns `AppStateContainer` object as [data].
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
      appState = getIt<AppState>();
    }
    super.initState();
  }

  /// Wrap `AppStateContainer` with `InheritedWidgetAppStateContainer`.
  @override
  Widget build(BuildContext context) {
    return InheritedAppStateContainer(
      data: this,
      child: widget.child,
    );
  }

  /// Refreshes the weather data by making a new API call for the given [location]
  /// by calling [appState.getWeatherForLocation(location: location)].
  ///
  /// When a response from the API is received the method signals
  /// the widget to trigger an update of the UI.
  Future<void> refreshWeatherData({@required String location}) async {
    await appState.getWeatherForLocation(location: location);
    setState(() {});
  }

  /// Loads the weather data by calling [appState.getWeatherForLocation(location: location)].
  ///
  /// Signals the UI to display a loading indicator by calling
  /// [appState.indicateLoading()].
  Future<void> fetchWeatherForLocation({@required String location}) async {
    appState.indicateLoading();
    setState(() {});
    await appState.getWeatherForLocation(location: location);
    setState(() {});
  }

  /// Switches the temperature unit from celcius to fahrenheit by calling [appState.toggleTemperatureUnit()].
  void toggleTemperatureUnit() {
    setState(() {
      appState.toggleTemperatureUnit();
    });
  }
}
