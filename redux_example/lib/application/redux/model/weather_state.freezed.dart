// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

  _WeatherState call(
      {@required WeatherEntity weatherEntity, bool isRefreshing}) {
    return _WeatherState(
      weatherEntity: weatherEntity,
      isRefreshing: isRefreshing,
    );
  }
}

// ignore: unused_element
const $WeatherState = _$WeatherStateTearOff();

mixin _$WeatherState {
  WeatherEntity get weatherEntity;
  bool get isRefreshing;

  $WeatherStateCopyWith<WeatherState> get copyWith;
}

abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
  $Res call({WeatherEntity weatherEntity, bool isRefreshing});

  $WeatherEntityCopyWith<$Res> get weatherEntity;
}

class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;

  @override
  $Res call({
    Object weatherEntity = freezed,
    Object isRefreshing = freezed,
  }) {
    return _then(_value.copyWith(
      weatherEntity: weatherEntity == freezed
          ? _value.weatherEntity
          : weatherEntity as WeatherEntity,
      isRefreshing:
          isRefreshing == freezed ? _value.isRefreshing : isRefreshing as bool,
    ));
  }

  @override
  $WeatherEntityCopyWith<$Res> get weatherEntity {
    if (_value.weatherEntity == null) {
      return null;
    }
    return $WeatherEntityCopyWith<$Res>(_value.weatherEntity, (value) {
      return _then(_value.copyWith(weatherEntity: value));
    });
  }
}

abstract class _$WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherStateCopyWith(
          _WeatherState value, $Res Function(_WeatherState) then) =
      __$WeatherStateCopyWithImpl<$Res>;
  @override
  $Res call({WeatherEntity weatherEntity, bool isRefreshing});

  @override
  $WeatherEntityCopyWith<$Res> get weatherEntity;
}

class __$WeatherStateCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherStateCopyWith<$Res> {
  __$WeatherStateCopyWithImpl(
      _WeatherState _value, $Res Function(_WeatherState) _then)
      : super(_value, (v) => _then(v as _WeatherState));

  @override
  _WeatherState get _value => super._value as _WeatherState;

  @override
  $Res call({
    Object weatherEntity = freezed,
    Object isRefreshing = freezed,
  }) {
    return _then(_WeatherState(
      weatherEntity: weatherEntity == freezed
          ? _value.weatherEntity
          : weatherEntity as WeatherEntity,
      isRefreshing:
          isRefreshing == freezed ? _value.isRefreshing : isRefreshing as bool,
    ));
  }
}

class _$_WeatherState with DiagnosticableTreeMixin implements _WeatherState {
  const _$_WeatherState({@required this.weatherEntity, this.isRefreshing})
      : assert(weatherEntity != null);

  @override
  final WeatherEntity weatherEntity;
  @override
  final bool isRefreshing;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherState(weatherEntity: $weatherEntity, isRefreshing: $isRefreshing)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherState'))
      ..add(DiagnosticsProperty('weatherEntity', weatherEntity))
      ..add(DiagnosticsProperty('isRefreshing', isRefreshing));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherState &&
            (identical(other.weatherEntity, weatherEntity) ||
                const DeepCollectionEquality()
                    .equals(other.weatherEntity, weatherEntity)) &&
            (identical(other.isRefreshing, isRefreshing) ||
                const DeepCollectionEquality()
                    .equals(other.isRefreshing, isRefreshing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherEntity) ^
      const DeepCollectionEquality().hash(isRefreshing);

  @override
  _$WeatherStateCopyWith<_WeatherState> get copyWith =>
      __$WeatherStateCopyWithImpl<_WeatherState>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {@required WeatherEntity weatherEntity,
      bool isRefreshing}) = _$_WeatherState;

  @override
  WeatherEntity get weatherEntity;
  @override
  bool get isRefreshing;
  @override
  _$WeatherStateCopyWith<_WeatherState> get copyWith;
}
