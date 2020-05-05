import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vanilla/injection.dart';
import 'package:vanilla/presentation/app_state_container.dart';

void main() {
  // Initialises the code generation for [get_it].
  configureInjection(Environment.prod);
  runApp(AppStateContainer());
}
