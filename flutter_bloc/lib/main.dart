import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/injection.dart';
import 'package:flutter_bloc_example/presentation/flutter_bloc_app.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => getIt<ThemeBloc>(),
      child: FlutterBlocApp(),
    ),
  );
}
