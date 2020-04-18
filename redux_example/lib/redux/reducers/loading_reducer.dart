import 'package:redux/redux.dart';
import 'package:redux_example/redux/actions/weather_actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, FetchWeatherAction>(_setIsLoading),
  TypedReducer<bool, WeatherLoadedAction>(_setLoaded),
  TypedReducer<bool, WeatherNotLoadedAction>(_setLoaded)
]);

bool _setIsLoading(bool state, FetchWeatherAction action) {
  return true;
}

bool _setLoaded(bool state, action) {
  return false;
}
