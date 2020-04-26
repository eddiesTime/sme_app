import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:inherited_widget/application/app_state.dart';
import 'package:inherited_widget/application/inherited_app_state_container.dart';
import 'package:inherited_widget/injection.dart';

class AppStateContainer extends StatefulWidget {
  final AppState appState;
  final Widget child;

  const AppStateContainer({
    @required this.child,
    this.appState,
  });

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

  @override
  Widget build(BuildContext context) {
    return InheritedAppStateContainer(
      data: this,
      child: widget.child,
    );
  }

  Future<void> refreshWeatherData({@required String location}) async {
    await appState.getWeatherForLocation(location: location);
    setState(() {});
  }

  Future<void> fetchWeatherForLocation({@required String location}) async {
    appState.indicateLoading();
    setState(() {});
    await appState.getWeatherForLocation(location: location);
    setState(() {});
  }

  void toggleTemperatureUnit() {
    setState(() {
      appState.toggleTemperatureUnit();
    });
  }
}
