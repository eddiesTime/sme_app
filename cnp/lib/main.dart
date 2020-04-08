import 'package:cnp/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:cnp/change_notifier_provider_app.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => ThemeModel(), child: ChangeNotifierProviderApp()));
