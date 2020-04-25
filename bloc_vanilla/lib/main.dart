import 'package:bloc_vanilla/injection.dart';
import 'package:bloc_vanilla/presentation/bloc_vanilla_app.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(BlocVanillaApp());
}
