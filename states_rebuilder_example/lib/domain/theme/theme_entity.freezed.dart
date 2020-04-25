// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'theme_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeEntityTearOff {
  const _$ThemeEntityTearOff();

  _ThemeEntity call(
      {@required ThemeData themeData, @required MaterialColor materialColor}) {
    return _ThemeEntity(
      themeData: themeData,
      materialColor: materialColor,
    );
  }
}

// ignore: unused_element
const $ThemeEntity = _$ThemeEntityTearOff();

mixin _$ThemeEntity {
  ThemeData get themeData;
  MaterialColor get materialColor;

  $ThemeEntityCopyWith<ThemeEntity> get copyWith;
}

abstract class $ThemeEntityCopyWith<$Res> {
  factory $ThemeEntityCopyWith(
          ThemeEntity value, $Res Function(ThemeEntity) then) =
      _$ThemeEntityCopyWithImpl<$Res>;
  $Res call({ThemeData themeData, MaterialColor materialColor});
}

class _$ThemeEntityCopyWithImpl<$Res> implements $ThemeEntityCopyWith<$Res> {
  _$ThemeEntityCopyWithImpl(this._value, this._then);

  final ThemeEntity _value;
  // ignore: unused_field
  final $Res Function(ThemeEntity) _then;

  @override
  $Res call({
    Object themeData = freezed,
    Object materialColor = freezed,
  }) {
    return _then(_value.copyWith(
      themeData:
          themeData == freezed ? _value.themeData : themeData as ThemeData,
      materialColor: materialColor == freezed
          ? _value.materialColor
          : materialColor as MaterialColor,
    ));
  }
}

abstract class _$ThemeEntityCopyWith<$Res>
    implements $ThemeEntityCopyWith<$Res> {
  factory _$ThemeEntityCopyWith(
          _ThemeEntity value, $Res Function(_ThemeEntity) then) =
      __$ThemeEntityCopyWithImpl<$Res>;
  @override
  $Res call({ThemeData themeData, MaterialColor materialColor});
}

class __$ThemeEntityCopyWithImpl<$Res> extends _$ThemeEntityCopyWithImpl<$Res>
    implements _$ThemeEntityCopyWith<$Res> {
  __$ThemeEntityCopyWithImpl(
      _ThemeEntity _value, $Res Function(_ThemeEntity) _then)
      : super(_value, (v) => _then(v as _ThemeEntity));

  @override
  _ThemeEntity get _value => super._value as _ThemeEntity;

  @override
  $Res call({
    Object themeData = freezed,
    Object materialColor = freezed,
  }) {
    return _then(_ThemeEntity(
      themeData:
          themeData == freezed ? _value.themeData : themeData as ThemeData,
      materialColor: materialColor == freezed
          ? _value.materialColor
          : materialColor as MaterialColor,
    ));
  }
}

class _$_ThemeEntity with DiagnosticableTreeMixin implements _ThemeEntity {
  const _$_ThemeEntity({@required this.themeData, @required this.materialColor})
      : assert(themeData != null),
        assert(materialColor != null);

  @override
  final ThemeData themeData;
  @override
  final MaterialColor materialColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeEntity(themeData: $themeData, materialColor: $materialColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeEntity'))
      ..add(DiagnosticsProperty('themeData', themeData))
      ..add(DiagnosticsProperty('materialColor', materialColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeEntity &&
            (identical(other.themeData, themeData) ||
                const DeepCollectionEquality()
                    .equals(other.themeData, themeData)) &&
            (identical(other.materialColor, materialColor) ||
                const DeepCollectionEquality()
                    .equals(other.materialColor, materialColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(themeData) ^
      const DeepCollectionEquality().hash(materialColor);

  @override
  _$ThemeEntityCopyWith<_ThemeEntity> get copyWith =>
      __$ThemeEntityCopyWithImpl<_ThemeEntity>(this, _$identity);
}

abstract class _ThemeEntity implements ThemeEntity {
  const factory _ThemeEntity(
      {@required ThemeData themeData,
      @required MaterialColor materialColor}) = _$_ThemeEntity;

  @override
  ThemeData get themeData;
  @override
  MaterialColor get materialColor;
  @override
  _$ThemeEntityCopyWith<_ThemeEntity> get copyWith;
}
