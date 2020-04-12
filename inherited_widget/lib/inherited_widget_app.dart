import 'package:flutter/material.dart';
import 'package:inherited_widget/app_state.dart';
import 'package:inherited_widget/app_state_container.dart';
import 'package:inherited_widget/pages/pages.dart';

class InheritedWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStateContainerState appStateContainer =
        AppStateContainer.of(context);
    final AppState appState = appStateContainer.appState;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appState.theme,
      home: WeatherPage(),
    );
  }
}
