import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx_example/application/theme/theme_store.dart';
import 'package:mobx_example/injection.dart';
import 'package:mobx_example/presentation/mobx_app.dart';
import 'package:provider/provider.dart';

void main() {
  // Initialises the code generation for [get_it].
  configureInjection(Environment.prod);
  runApp(
    Provider<ThemeStore>(
      create: (context) => getIt<ThemeStore>(),
      child: MobxApp(),
    ),
  );
}
