import 'package:flutter/material.dart';
import 'package:inherited_widget/application/app_state.dart';
import 'package:inherited_widget/injection.dart';
import 'package:inherited_widget/presentation/app_state_container.dart';
import 'package:inherited_widget/presentation/inherited_widget_app.dart';
import 'package:injectable/injectable.dart';

void main() {
  // Initialises the code generation for [get_it].
  configureInjection(Environment.prod);
  runApp(
    AppStateContainer(
      appState: getIt<AppState>(),
      child: InheritedWidgetApp(),
    ),
  );
}
