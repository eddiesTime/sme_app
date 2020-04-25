import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:flutter_bloc_example/presentation/weather/pages/weather_page.dart';

class FlutterBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>(
              create: (_) => getIt<WeatherBloc>(),
            ),
            BlocProvider<SettingsBloc>(
              create: (context) => getIt<SettingsBloc>(),
            )
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: themeState.themeEntity.themeData,
              home: WeatherPage()),
        );
      },
    );
  }
}
