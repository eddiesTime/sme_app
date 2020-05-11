part of 'theme_bloc.dart';

/// An interface to specifiy `ThemeEvents`.
@freezed
abstract class ThemeEvent with _$ThemeEvent {
  /// A Theme Event that signals that the weather has changed with a given [weatherCondition].
  const factory ThemeEvent.weatherChanged(WeatherCondition weatherCondition) =
      WeatherChanged;
}
