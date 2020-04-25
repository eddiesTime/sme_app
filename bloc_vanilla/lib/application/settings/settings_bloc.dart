import 'dart:async';
import 'package:bloc_vanilla/application/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'settings_event.dart';
part 'settings_bloc.freezed.dart';

@lazySingleton
class SettingsBloc implements Bloc {
  final StreamController<TemperatureUnit> _settingsStateController =
      BehaviorSubject();
  StreamSink<TemperatureUnit> get _inTempUnit => _settingsStateController.sink;
  Stream<TemperatureUnit> get temperatureUnit =>
      _settingsStateController.stream;

  final _settingsEventController = StreamController<SettingsEvent>();

  Sink<SettingsEvent> get settingsEventSink => _settingsEventController.sink;

  SettingsBloc() {
    _inTempUnit.add(TemperatureUnit.celsius);
    _settingsEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(SettingsEvent event) {
    if (event is ToggleTemperatureUnit) {
      event.value
          ? _inTempUnit.add(TemperatureUnit.celsius)
          : _inTempUnit.add(TemperatureUnit.fahrenheit);
    }
  }

  @override
  void dispose() {
    _settingsEventController.close();
    _settingsStateController.close();
  }
}
