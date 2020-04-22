import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/blocs/temperature_bloc/bloc/temperature_bloc.dart';
import 'package:flutter_bloc_example/blocs/theme_bloc/bloc/theme_bloc.dart';
import 'package:flutter_bloc_example/blocs/weather_bloc/bloc/weather_bloc.dart';
import 'package:flutter_bloc_example/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

class FlutterBlocApp extends StatelessWidget {
  final WeatherRepository weatherRepo;

  FlutterBlocApp({@required WeatherRepository this.weatherRepo});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc(weatherRepo: weatherRepo),
            ),
            BlocProvider<TemperatureBloc>(
              create: (context) => TemperatureBloc(),
            )
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: themeState.theme,
              home: WeatherPage()),
        );
      },
    );
  }
}
