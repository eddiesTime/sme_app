part of 'temperature_bloc.dart';

@immutable
class TemperatureState {
  final TemperatureUnit temperatureUnit;

  TemperatureState({@required TemperatureUnit this.temperatureUnit})
      : assert(temperatureUnit != null);
}
