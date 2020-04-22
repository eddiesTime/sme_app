import 'package:cnp/temperature_model.dart';
import 'package:cnp/theme_model.dart';
import 'package:cnp/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:cnp/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

class ChangeNotifierProviderApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ChangeNotifierProviderAppState createState() =>
      _ChangeNotifierProviderAppState();
}

class _ChangeNotifierProviderAppState extends State<ChangeNotifierProviderApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<WeatherModel>(
              create: (_) => WeatherModel(
                  Provider.of<ThemeModel>(context), WeatherRepository())),
          ChangeNotifierProvider<TemperatureModel>(
            create: (_) => TemperatureModel(),
          )
        ],
        child: Consumer<ThemeModel>(
            builder: (
          context,
          data,
          child,
        ) =>
                MaterialApp(
                  title: 'Flutter Demo',
                  theme: data.theme,
                  home: WeatherPage(),
                )));
  }
}
