part of 'weather_bloc.dart';

/// An interface to specify weather states.
@freezed
abstract class WeatherState with _$WeatherState {
  /// Specifies a weather state that indicates the initial state.
  const factory WeatherState.initial() = Initial;

  /// Specifies a weather state that indicates the loading state.
  const factory WeatherState.loading() = Loading;

  /// Specifies a weather state that indicates a loading failure state.
  const factory WeatherState.loadingFailure() = LoadingFailure;

  /// Specifies a weather state that indicates a successful loading state.
  const factory WeatherState.loaded(WeatherEntity weatherEntity) = Loaded;
}
