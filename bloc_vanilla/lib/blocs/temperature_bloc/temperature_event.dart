import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class TemperatureEvent {}

class ToggleUnit extends TemperatureEvent {
  ToggleUnit({@required bool this.value});
  final bool value;
}
