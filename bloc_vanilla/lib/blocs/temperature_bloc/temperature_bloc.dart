import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:bloc_vanilla/blocs/temperature_bloc/temperature_event.dart';
import 'package:bloc_vanilla/blocs/bloc.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class TemperatureBloc implements Bloc {
  final StreamController<TemperatureUnit> _tempUnitStateController =
      BehaviorSubject();
  StreamSink<TemperatureUnit> get _inTempUnit => _tempUnitStateController.sink;
  Stream<TemperatureUnit> get temperatureUnit =>
      _tempUnitStateController.stream;

  final _tempUnitEventController = StreamController<TemperatureEvent>();

  Sink<TemperatureEvent> get temperatureEventSink =>
      _tempUnitEventController.sink;

  TemperatureBloc() {
    _inTempUnit.add(TemperatureUnit.celsius);
    _tempUnitEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TemperatureEvent event) {
    if (event is ToggleUnit) {
      event.value
          ? _inTempUnit.add(TemperatureUnit.celsius)
          : _inTempUnit.add(TemperatureUnit.fahrenheit);
    }
  }

  @override
  void dispose() {
    _tempUnitEventController.close();
    _tempUnitStateController.close();
  }
}
