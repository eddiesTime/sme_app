import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/actions/weather_actions.dart';

/// Is a collection of loading related reducers.
final Reducer<bool> loadingReducer = combineReducers<bool>([
  TypedReducer<bool, FetchWeatherAction>(_setIsLoading),
  TypedReducer<bool, WeatherLoadedAction>(_setLoaded),
  TypedReducer<bool, WeatherNotLoadedAction>(_setLoaded)
]);

/// Returns [true] when a data request has been started.
bool _setIsLoading(bool state, FetchWeatherAction action) {
  return true;
}

/// Returns [false] when a data request has been finished.
bool _setLoaded(bool state, action) {
  return false;
}
