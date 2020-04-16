import 'package:flutter/material.dart';
import 'package:redux_example/redux_app.dart';
import 'package:redux_example/weather_repository.dart';

void main() => runApp(
      ReduxApp(weatherRepo: WeatherRepository()),
    );
