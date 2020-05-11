part of 'theme_bloc.dart';

/// An interface to specify theme events.
@freezed
abstract class ThemeEvent with _$ThemeEvent {
  /// Specifies a theme event that indicates that the weather changed for a given [WeatherCondition].
  const factory ThemeEvent.weatherChanged(WeatherCondition weatherCondition) =
      WeatherChanged;
}
