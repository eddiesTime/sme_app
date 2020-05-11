import 'dart:async';
import 'package:bloc_vanilla/application/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'settings_event.dart';
part 'settings_bloc.freezed.dart';

// A business logic component to handle weather related logic in the application.
@lazySingleton
class SettingsBloc implements Bloc {
  /// Uses the `BehaviourSubject` from `rxdart` to create an advanced [StreamController].
  final StreamController<TemperatureUnit> _settingsStateController =
      BehaviorSubject();

  /// A reference to the `stream sink` of the `BehaviourSubject`.
  StreamSink<TemperatureUnit> get _inTempUnit => _settingsStateController.sink;

  /// A reference to the `stream` of the `BehaviourSubject`.
  Stream<TemperatureUnit> get temperatureUnit =>
      _settingsStateController.stream;

  /// Creates an instance of a `settings event StreamController`.
  final _settingsEventController = StreamController<SettingsEvent>();

  /// A reference to the `settings StreamController's sink`.
  Sink<SettingsEvent> get settingsEventSink => _settingsEventController.sink;

  SettingsBloc() {
    // Add an initial ThemeEntity to the StreamController's stream.
    _inTempUnit.add(TemperatureUnit.celsius);
    // Start to listen to the weather event stream to be able to react to events.
    _settingsEventController.stream.listen(_mapEventToState);
  }

  /// Map the `event` to a `reaction`.
  void _mapEventToState(SettingsEvent event) {
    if (event is ToggleTemperatureUnit) {
      event.value
          ? _inTempUnit.add(TemperatureUnit.celsius)
          : _inTempUnit.add(TemperatureUnit.fahrenheit);
    }
  }

  /// Closes all [StreamController] inside the settings bloc when it gets disposed.
  @override
  void dispose() {
    _settingsEventController.close();
    _settingsStateController.close();
  }
}
