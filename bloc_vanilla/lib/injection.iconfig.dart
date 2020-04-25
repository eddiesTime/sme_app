// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:bloc_vanilla/application/settings/settings_bloc.dart';
import 'package:bloc_vanilla/domain/settings/settings_entity.dart';
import 'package:bloc_vanilla/application/theme/theme_bloc.dart';
import 'package:bloc_vanilla/domain/theme/theme_entity.dart';
import 'package:bloc_vanilla/domain/weather/weather_entity.dart';
import 'package:weather_repository_core/weather_repository_core.dart';
import 'package:bloc_vanilla/infrastructure/weather/weather_repository_injectable_module.dart';
import 'package:bloc_vanilla/infrastructure/weather/weather_repository_facade.dart';
import 'package:bloc_vanilla/domain/weather/i_weather_facade.dart';
import 'package:bloc_vanilla/application/weather/weather_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final weatherRepositoryInjectableModule =
      _$WeatherRepositoryInjectableModule();
  g.registerLazySingleton<SettingsBloc>(() => SettingsBloc());
  g.registerFactory<SettingsEntity>(() => SettingsEntity.celsius());
  g.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  g.registerFactory<ThemeEntity>(() => ThemeEntity.initial());
  g.registerFactory<WeatherEntity>(() => WeatherEntity.initial());
  g.registerLazySingleton<WeatherRepository>(
      () => weatherRepositoryInjectableModule.weatherRepository);
  g.registerLazySingleton<WeatherBloc>(
      () => WeatherBloc(g<IWeatherFacade>(), g<ThemeBloc>()));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IWeatherFacade>(
        () => WeatherRepositoryFacade(g<WeatherRepository>()));
  }
}

class _$WeatherRepositoryInjectableModule
    extends WeatherRepositoryInjectableModule {}
