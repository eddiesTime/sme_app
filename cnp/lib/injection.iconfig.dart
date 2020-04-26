// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cnp/domain/settings/settings_entity.dart';
import 'package:cnp/application/settings/settings_notifier.dart';
import 'package:cnp/domain/theme/theme_entity.dart';
import 'package:cnp/application/theme/theme_notifier.dart';
import 'package:cnp/domain/weather/weather_entity.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:cnp/infrastructure/weather/weather_repository_injectable_module.dart';
import 'package:cnp/infrastructure/weather/weather_repository_facade.dart';
import 'package:cnp/domain/weather/i_weather_facade.dart';
import 'package:cnp/application/weather/weather_notifier.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  g.registerLazySingleton<SettingsNotifier>(
      () => SettingsNotifier(g<SettingsEntity>()));
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier(g<ThemeEntity>()));
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  g.registerLazySingleton<WeatherNotifier>(() => WeatherNotifier(
        g<WeatherEntity>(),
        g<ThemeNotifier>(),
        g<IWeatherFacade>(),
      ));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IWeatherFacade>(
        () => WeatherRepositoryFacade(g<WeatherRepository>()));
  }
}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
