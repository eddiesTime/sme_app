part of 'theme_bloc.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.weatherChanged(WeatherCondition weatherCondition) =
      WeatherChanged;
}
