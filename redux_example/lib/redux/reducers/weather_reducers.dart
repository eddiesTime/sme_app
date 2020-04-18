import 'package:redux/redux.dart';
import 'package:redux_example/redux/actions/weather_actions.dart';
import 'package:redux_example/redux/model/weather_state.dart';

final weatherReducer = combineReducers<WeatherState>([
  TypedReducer<WeatherState, WeatherLoadedAction>(_setWeather),
  TypedReducer<WeatherState, WeatherNotLoadedAction>(_setNoWeatherState),
  TypedReducer<WeatherState, SetIsRefreshingAction>(_setIsRefreshingWeather),

  // TypedReducer<WeatherState, WeatherChangedAction>(),
]);

WeatherState _setIsRefreshingWeather(WeatherState state, action) {
  return WeatherState(
      city: state.city,
      lastUpdated: state.lastUpdated,
      weatherResponse: state.weatherResponse,
      isRefreshing: true);
}

WeatherState _setWeather(
    WeatherState weatherState, WeatherLoadedAction action) {
  // print('WeatherState: $action');
  return WeatherState(
      city: action.weatherResponse.title,
      lastUpdated: DateTime.now(),
      weatherResponse: action.weatherResponse,
      isRefreshing: false);
}

WeatherState _setNoWeatherState(
    WeatherState weatherState, WeatherNotLoadedAction action) {
  return WeatherState(
      city: null, lastUpdated: null, weatherResponse: null, hasError: true);
}
