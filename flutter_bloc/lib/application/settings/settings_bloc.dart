import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

/// A business logic component to handle settings related logic in the application.
@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => SettingsState.celcius();

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is ToggleTemperatureUnit) {
      yield event.value ? SettingsState.celcius() : SettingsState.fahrenheit();
    }
  }
}
