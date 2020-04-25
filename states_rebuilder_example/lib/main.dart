import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/application/theme/theme_store.dart';
import 'package:states_rebuilder_example/domain/theme/theme_entity.dart';
import 'package:states_rebuilder_example/injection.dart';
import 'package:states_rebuilder_example/presentation/states_rebuilder_app.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(
    Injector(
      inject: [
        Inject<ThemeStore>(
          () => ThemeStore(
            getIt<ThemeEntity>(),
          ),
        ),
      ],
      builder: (context) => StatesRebuilderApp(),
    ),
  );
}
