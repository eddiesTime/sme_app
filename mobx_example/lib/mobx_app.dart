import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/stores/theme_store.dart';
import 'package:mobx_example/pages/weather_page.dart';
import 'package:mobx_example/stores/temperature_store.dart';
import 'package:mobx_example/stores/weather_store.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:provider/provider.dart';

class MobxApp extends StatelessWidget {
  final WeatherRepository weatherRepo;

  MobxApp({@required WeatherRepository this.weatherRepo});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherStore>(
          create: (context) => WeatherStore(
              weatherRepo: weatherRepo,
              themeStore: Provider.of<ThemeStore>(context, listen: false)),
        ),
        Provider<TemperatureStore>(
          create: (context) => TemperatureStore(),
        )
      ],
      child: Observer(
        builder: (_) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: Provider.of<ThemeStore>(context).theme,
              home: WeatherPage());
        },
      ),
    );
  }
}
