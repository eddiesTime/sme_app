import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/pages/pages.dart';
import 'package:states_rebuilder_example/stores/temperature_store.dart';
import 'package:states_rebuilder_example/stores/theme_store.dart';
import 'package:states_rebuilder_example/stores/weather_store.dart';
import 'package:states_rebuilder_example/weather_repository.dart';

class StatesRebuilderApp extends StatelessWidget {
  final WeatherRepository weatherRepo;

  StatesRebuilderApp({@required WeatherRepository this.weatherRepo});

  @override
  Widget build(BuildContext context) {
    final _themeStore = Injector.getAsReactive<ThemeStore>();
    return Injector(
      inject: [
        Inject<WeatherStore>(() =>
            WeatherStore(weatherRepo: weatherRepo, themeStore: _themeStore)),
        Inject<TemperatureStore>(() => TemperatureStore())
      ],
      builder: (context) => StateBuilder<ThemeStore>(
          models: [_themeStore],
          builder: (context, reactiveModel) {
            return MaterialApp(
                title: 'Flutter Demo',
                theme: _themeStore.state.theme,
                home: WeatherPage());
          }),
    );
  }
}
