import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'temperature_event.dart';
part 'temperature_state.dart';

class TemperatureBloc extends Bloc<TemperatureEvent, TemperatureState> {
  @override
  TemperatureState get initialState {
    return TemperatureState(temperatureUnit: TemperatureUnit.celsius);
  }

  @override
  Stream<TemperatureState> mapEventToState(
    TemperatureEvent event,
  ) async* {
    if (event is ToggleUnit) {
      yield* _mapToggleUnitToState();
    }
  }

  Stream<TemperatureState> _mapToggleUnitToState() async* {
    yield TemperatureState(
      temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
          ? TemperatureUnit.fahrenheit
          : TemperatureUnit.celsius,
    );
  }
}
