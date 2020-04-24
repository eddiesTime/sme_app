import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vanilla/injection.dart';
import 'package:vanilla/presentation/app_state_container.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppStateContainer());
}
