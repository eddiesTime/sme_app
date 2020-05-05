/// This library provides weather data from [MetaWeather](https://www.metaweather.com/).
///
/// To receive the weather data for a city use the `getWeatherFor` method.
///
/// The following code snippet shows how to retrieve the weather data
/// for London:
/// ```dart
/// ...
///   await getWeatherFor(city: 'London');
/// ...
/// ```
library weather_repository_core;

export 'src/weather_repository.dart';
