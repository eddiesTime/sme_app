import 'package:flutter/material.dart';
import 'package:inherited_widget/app_state_container.dart';
import 'package:inherited_widget/inherited_widget_app.dart';
import 'package:inherited_widget/weather_repository.dart';

void main() => runApp(AppStateContainer(
      child: InheritedWidgetApp(),
      weatherRepository: WeatherRepository(),
    ));
