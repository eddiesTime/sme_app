// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:states_rebuilder_example/domain/settings/settings_entity.dart';
import 'package:states_rebuilder_example/domain/theme/theme_entity.dart';
import 'package:states_rebuilder_example/domain/weather/weather_entity.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:states_rebuilder_example/infrastructure/weather/weather_repository_injectable_module.dart';
import 'package:states_rebuilder_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:states_rebuilder_example/domain/weather/i_weather_facade.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IWeatherFacade>(
        () => WeatherRepositoryFacade(g<WeatherRepository>()));
  }
}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
