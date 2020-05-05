import 'package:redux_example/application/redux/model/models.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Returns the `WeatherResponse` of the current weather state or null
/// if none is present.
WeatherResponse weatherResponseSelector(AppState state) =>
    state.weatherState.weatherEntity.weatherResponse.getOrElse(() => null);

/// Returns the `DateTime` when the weather data was loaded last or null if it has not been yet.
DateTime lastUpdatedSelector(AppState state) =>
    state.weatherState.weatherEntity.lastUpdated.getOrElse(() => null);

/// Returns the name of the city weather data was loaded for last.
String citySelector(AppState state) => state.weatherState.weatherEntity.city;

/// Returns the `WeatherState` of the current state.
WeatherState weatherStateSelector(AppState state) => state.weatherState;
