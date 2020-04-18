import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/model/models.dart' as model;
import 'package:redux_example/redux/actions/actions.dart';
import 'package:redux_example/redux/model/models.dart';
import 'package:redux_example/redux/selectors/selectors.dart';
import 'package:redux_example/weather_repository.dart';

List<Middleware<AppState>> createWeatherMiddleware(
  WeatherRepository weatherRepository,
) {
  final fetchWeather = _createFetchWeather(weatherRepository);
  final refreshWeather = _createRefreshWeather(weatherRepository);

  return [
    TypedMiddleware<AppState, FetchWeatherAction>(fetchWeather),
    TypedMiddleware<AppState, RefreshWeatherAction>(refreshWeather),
  ];
}

dynamic _createFetchWeather(WeatherRepository weatherRepository) {
  return (
    Store<AppState> store,
    FetchWeatherAction action,
    NextDispatcher next,
  ) {
    weatherRepository.getWeatherFor(city: action.city).then((weatherResponse) {
      return store.dispatch(WeatherLoadedAction(weatherResponse));
    }).catchError((_) => store.dispatch(WeatherNotLoadedAction()));
    next(action);
  };
}

dynamic _createRefreshWeather(WeatherRepository weatherRepository) {
  return (
    Store<AppState> store,
    RefreshWeatherAction action,
    NextDispatcher next,
  ) {
    store.dispatch(SetIsRefreshingAction());
    weatherRepository
        .getWeatherFor(city: citySelector(store.state))
        .then((model.WeatherResponse weatherResponse) =>
            store.dispatch(WeatherLoadedAction(weatherResponse)))
        .catchError((_) => store.dispatch(WeatherNotLoadedAction()));
    next(action);
  };
}
