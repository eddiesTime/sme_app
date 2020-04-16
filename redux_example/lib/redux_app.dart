import 'package:flutter/material.dart';
import 'package:redux_example/weather_repository.dart';

class ReduxApp extends StatelessWidget {
  final WeatherRepository weatherRepo;

  ReduxApp({@required WeatherRepository this.weatherRepo});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     title: 'Flutter Demo', theme: theme, home: WeatherPage());
  }
}
