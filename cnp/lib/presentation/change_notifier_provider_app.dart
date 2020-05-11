import 'package:cnp/application/notifers.dart';
import 'package:cnp/injection.dart';
import 'package:cnp/presentation/weather/pages/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherNotifier>(
          create: (_) => getIt<WeatherNotifier>(),
        ),
        ChangeNotifierProvider<SettingsNotifier>(
          create: (_) => getIt<SettingsNotifier>(),
        ),
      ],

      /// Consumes the [ThemeNotifier] and rebuilds the MaterialApp whenever it receive a `change notification`.
      child: Consumer<ThemeNotifier>(
        builder: (context, data, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: data.theme,
          home: WeatherPage(),
        ),
      ),
    );
  }
}
