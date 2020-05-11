import 'package:bloc_vanilla/application/theme/theme_bloc.dart';
import 'package:bloc_vanilla/domain/theme/theme_entity.dart';
import 'package:bloc_vanilla/injection.dart';

import 'package:bloc_vanilla/presentation/weather/pages/weather_page.dart';
import 'package:flutter/material.dart';

class BlocVanillaApp extends StatelessWidget {
  final ThemeBloc _themeBloc = getIt<ThemeBloc>();
  @override
  Widget build(BuildContext context) {
    // Rebuilds the app whenever an event is emitted which signals that the weather has changed.
    return StreamBuilder<ThemeEntity>(
        stream: _themeBloc.themeEntity,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: snapshot.data.themeData,
              home: WeatherPage(),
            );
          }
          return Container();
        });
  }
}
