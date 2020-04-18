import 'dart:convert';

import 'package:flutter/material.dart';

class ThemeState {
  const ThemeState({@required this.theme, @required this.color});

  final ThemeData theme;
  final MaterialColor color;

  ThemeState copyWith({
    ThemeData theme,
    MaterialColor color,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      color: color ?? this.color,
    );
  }

  dynamic toJson() => {
        'theme': theme,
        'color': color,
      };

  @override
  String toString() {
    return 'ThemeState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
