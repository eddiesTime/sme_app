import 'package:flutter/material.dart';
import 'package:mobx_example/mobx_app.dart';
import 'package:mobx_example/stores/theme_store.dart';
import 'package:mobx_example/weather_repository.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      Provider<ThemeStore>(
        create: (context) => ThemeStore(),
        child: MobxApp(weatherRepo: WeatherRepository()),
      ),
    );
