import 'package:redux_example/model/weather_response/weather_response.dart';
import 'package:redux_example/redux/model/app_state.dart';
import 'package:redux_example/redux/model/models.dart';

WeatherResponse weatherResponseSelector(AppState state) =>
    state.weatherState.weatherResponse;
DateTime lastUpdatedSelector(AppState state) => state.weatherState.lastUpdated;
String citySelector(AppState state) => state.weatherState.city;
WeatherState weatherStateSelector(AppState state) => state.weatherState;
