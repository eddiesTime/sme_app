import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/states_rebuilder_app.dart';
import 'package:states_rebuilder_example/stores/theme_store.dart';
import 'package:states_rebuilder_example/weather_repository.dart';

void main() => runApp(Injector(
    inject: [Inject<ThemeStore>(() => ThemeStore())],
    builder: (context) =>
        StatesRebuilderApp(weatherRepo: WeatherRepository())));
