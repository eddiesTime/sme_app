import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/actions/weather_actions.dart';
import 'package:redux_example/application/redux/model/weather_state.dart';
import 'package:redux_example/domain/weather/weather_entity.dart';
import 'package:dartz/dartz.dart';

final Reducer<WeatherState> weatherReducer = combineReducers<WeatherState>([
  TypedReducer<WeatherState, WeatherLoadedAction>(_setWeather),
  TypedReducer<WeatherState, WeatherNotLoadedAction>(_setNoWeatherState),
  TypedReducer<WeatherState, RefreshWeatherAction>(_setIsRefreshingWeather),
]);

WeatherState _setIsRefreshingWeather(WeatherState state, action) {
  return WeatherState.isRefreshing(weatherEntity: state.weatherEntity);
}

WeatherState _setWeather(
    WeatherState weatherState, WeatherLoadedAction action) {
  return WeatherState(
    weatherEntity: WeatherEntity(
      weatherResponse: some(action.weatherResponse),
      city: action.weatherResponse.title,
      hasError: false,
      lastUpdated: some(DateTime.now()),
    ),
    isRefreshing: false,
  );
}

WeatherState _setNoWeatherState(
    WeatherState weatherState, WeatherNotLoadedAction action) {
  return WeatherState.initial(
    weatherEntity: WeatherEntity.loadingFailure(),
  );
}
