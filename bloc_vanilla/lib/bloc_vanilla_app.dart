import 'package:flutter/material.dart';

import 'package:weather_repository_core/weather_repository_core.dart';

import 'package:bloc_vanilla/blocs/bloc_provider.dart';
import 'package:bloc_vanilla/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_vanilla/pages/pages.dart';
import 'blocs/temperature_bloc/temperature_bloc.dart';
import 'blocs/weather_bloc/weather_bloc.dart';

class BlocVanillaApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _BlocVanillaAppState createState() => _BlocVanillaAppState();
}

class _BlocVanillaAppState extends State<BlocVanillaApp> {
  ThemeBloc _themeBloc;
  WeatherBloc _weatherBloc;
  TemperatureBloc _temperatureBloc;

  @override
  void initState() {
    super.initState();
    _themeBloc = ThemeBloc();
    _weatherBloc = WeatherBloc(
      weatherRepo: WeatherRepository(),
      themeBloc: _themeBloc,
    );
    _temperatureBloc = TemperatureBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      bloc: _themeBloc,
      child: BlocProvider<WeatherBloc>(
        bloc: _weatherBloc,
        child: BlocProvider<TemperatureBloc>(
          bloc: _temperatureBloc,
          child: StreamBuilder<ThemeData>(
              stream: _themeBloc.theme,
              builder: (context, snapshot) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: snapshot.data,
                  home: WeatherPage(),
                );
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _temperatureBloc.dispose();
    _weatherBloc.dispose();
    _themeBloc.dispose();
    super.dispose();
  }
}
