import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/application/stores.dart';
import 'package:mobx_example/injection.dart';
import 'package:mobx_example/presentation/weather/pages/weather_page.dart';
import 'package:provider/provider.dart';

class MobxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeStore _themeStore = Provider.of<ThemeStore>(context);
    return MultiProvider(
      providers: [
        Provider<WeatherStore>(
          create: (context) => getIt<WeatherStore>(),
        ),
        Provider<SettingsStore>(
          create: (context) => getIt<SettingsStore>(),
        )
      ],
      child: Observer(
        builder: (_) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _themeStore.theme,
            home: WeatherPage(),
          );
        },
      ),
    );
  }
}
