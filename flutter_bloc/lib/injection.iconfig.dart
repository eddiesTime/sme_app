// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/domain/settings/settings_entity.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_injectable_module.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_bloc_example/domain/weather/i_weather_facade.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerFactory<SettingsBloc>(() => SettingsBloc());
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  g.registerFactory<ThemeBloc>(() => ThemeBloc());
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  g.registerFactory<WeatherBloc>(() => WeatherBloc(g<IWeatherFacade>()));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IWeatherFacade>(
        () => WeatherRepositoryFacade(g<WeatherRepository>()));
  }
}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
