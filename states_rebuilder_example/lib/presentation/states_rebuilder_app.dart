import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/application/settings/settings_store.dart';
import 'package:states_rebuilder_example/application/theme/theme_store.dart';
import 'package:states_rebuilder_example/application/weather/weather_store.dart';
import 'package:states_rebuilder_example/domain/settings/settings_entity.dart';
import 'package:states_rebuilder_example/domain/weather/i_weather_facade.dart';
import 'package:states_rebuilder_example/domain/weather/weather_entity.dart';
import 'package:states_rebuilder_example/injection.dart';
import 'package:states_rebuilder_example/presentation/weather/pages/weather_page.dart';

class StatesRebuilderApp extends StatelessWidget {
  final _themeStore = Injector.getAsReactive<ThemeStore>();
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<WeatherStore>(
          () => WeatherStore(
            getIt<IWeatherFacade>(),
            _themeStore,
            getIt<WeatherEntity>(),
          ),
        ),
        Inject<SettingsStore>(
          () => SettingsStore(
            getIt<SettingsEntity>(),
          ),
        )
      ],
      builder: (context) => StateBuilder<ThemeStore>(
          models: [_themeStore],
          builder: (context, reactiveModel) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: _themeStore.state.themeEntity.themeData,
              home: WeatherPage(),
            );
          }),
    );
  }
}
