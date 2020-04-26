import 'package:cnp/application/theme/theme_notifier.dart';
import 'package:cnp/injection.dart';
import 'package:cnp/presentation/change_notifier_provider_app.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(
    ChangeNotifierProvider(
      create: (_) => getIt<ThemeNotifier>(),
      child: ChangeNotifierProviderApp(),
    ),
  );
}
