// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:mobx_example/domain/settings/settings_entity.dart';
import 'package:mobx_example/application/settings/settings_store.dart';
import 'package:mobx_example/domain/theme/theme_entity.dart';
import 'package:mobx_example/application/theme/theme_store.dart';
import 'package:mobx_example/domain/weather/weather_entity.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:mobx_example/infrastructure/weather/weather_repository_injectable_module.dart';
import 'package:mobx_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:mobx_example/domain/weather/i_weather_facade.dart';
import 'package:mobx_example/application/weather/weather_store.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  g.registerLazySingleton<SettingsStore>(
      () => SettingsStore(settingsEntity: g<SettingsEntity>()));
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerLazySingleton<ThemeStore>(
      () => ThemeStore(themeEntity: g<ThemeEntity>()));
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  g.registerLazySingleton<WeatherStore>(() => WeatherStore(
        weatherFacade: g<IWeatherFacade>(),
        themeStore: g<ThemeStore>(),
        weatherEntity: g<WeatherEntity>(),
      ));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IWeatherFacade>(
        () => WeatherRepositoryFacade(g<WeatherRepository>()));
  }
}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
