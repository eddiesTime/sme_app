import 'package:flutter/material.dart';
import 'package:inherited_widget/application/app_state.dart';
import 'package:inherited_widget/presentation/app_state_container.dart';
import 'package:inherited_widget/presentation/weather/pages/weather_page.dart';

class InheritedWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStateContainerState appStateContainer =
        AppStateContainer.of(context);
    final AppState appState = appStateContainer.appState;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appState.themeEntity.themeData,
      home: WeatherPage(),
    );
  }
}
