import 'package:flutter/material.dart';
import 'package:vanilla/vanilla_app.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

void main() => runApp(VanillaApp(
      weatherRepository: WeatherRepository(),
    ));
