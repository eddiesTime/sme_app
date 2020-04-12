import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/theme_bloc/bloc/theme_bloc.dart';
import 'package:flutter_bloc_example/flutter_bloc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/weather_repository.dart';

void main() => runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(),
    child: FlutterBlocApp(
      weatherRepo: WeatherRepository(),
    )));
