import 'package:redux_example/application/redux/model/models.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

WeatherResponse weatherResponseSelector(AppState state) =>
    state.weatherState.weatherEntity.weatherResponse.getOrElse(() => null);
DateTime lastUpdatedSelector(AppState state) =>
    state.weatherState.weatherEntity.lastUpdated.getOrElse(() => null);
String citySelector(AppState state) => state.weatherState.weatherEntity.city;
WeatherState weatherStateSelector(AppState state) => state.weatherState;
