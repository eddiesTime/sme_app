import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/actions/weather_actions.dart';
import 'package:redux_example/application/redux/model/app_state.dart';
import 'package:redux_example/application/redux/selectors/weather_selectors.dart';
import 'package:redux_example/domain/weather/i_weather_facade.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

List<Middleware<AppState>> createWeatherMiddleware(
  IWeatherFacade _weatherFacade,
) {
  final fetchWeather = _createFetchWeather(_weatherFacade);
  final refreshWeather = _createRefreshWeather(_weatherFacade);

  return [
    TypedMiddleware<AppState, FetchWeatherAction>(fetchWeather),
    TypedMiddleware<AppState, RefreshWeatherAction>(refreshWeather),
  ];
}

void Function(
  Store<AppState> store,
  FetchWeatherAction action,
  NextDispatcher next,
) _createFetchWeather(IWeatherFacade weatherFacade) {
  return (
    Store<AppState> store,
    FetchWeatherAction action,
    NextDispatcher next,
  ) {
    weatherFacade
        .getWeatherForLocation(location: action.location)
        .then((weatherResponse) {
      store.dispatch(WeatherLoadedAction(weatherResponse: weatherResponse));
    }).catchError(
      (_) => store.dispatch(
        const WeatherNotLoadedAction(),
      ),
    );
    next(action);
  };
}

void Function(
  Store<AppState> store,
  RefreshWeatherAction action,
  NextDispatcher next,
) _createRefreshWeather(IWeatherFacade weatherFacade) {
  return (
    Store<AppState> store,
    RefreshWeatherAction action,
    NextDispatcher next,
  ) {
    store.dispatch(
      const SetIsRefreshingAction(),
    );
    weatherFacade
        .getWeatherForLocation(location: citySelector(store.state))
        .then(
          (model.WeatherResponse weatherResponse) => store.dispatch(
            WeatherLoadedAction(weatherResponse: weatherResponse),
          ),
        )
        .catchError(
          (_) => store.dispatch(
            const WeatherNotLoadedAction(),
          ),
        );
    next(action);
  };
}
