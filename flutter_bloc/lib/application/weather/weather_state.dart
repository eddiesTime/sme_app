part of 'weather_bloc.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = Initial;
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.loadingFailure() = LoadingFailure;
  const factory WeatherState.loaded(WeatherEntity weatherEntity) = Loaded;
}
