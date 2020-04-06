// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call(
      {String title,
      @JsonKey(name: 'location_type') String locationType,
      @JsonKey(name: 'woeid') int woeId,
      @JsonKey(name: 'latt_long') String lattLong,
      int distance}) {
    return _Location(
      title: title,
      locationType: locationType,
      woeId: woeId,
      lattLong: lattLong,
      distance: distance,
    );
  }
}

// ignore: unused_element
const $Location = _$LocationTearOff();

mixin _$Location {
  String get title;
  @JsonKey(name: 'location_type')
  String get locationType;
  @JsonKey(name: 'woeid')
  int get woeId;
  @JsonKey(name: 'latt_long')
  String get lattLong;
  int get distance;

  Map<String, dynamic> toJson();
  $LocationCopyWith<Location> get copyWith;
}

abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call(
      {String title,
      @JsonKey(name: 'location_type') String locationType,
      @JsonKey(name: 'woeid') int woeId,
      @JsonKey(name: 'latt_long') String lattLong,
      int distance});
}

class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object title = freezed,
    Object locationType = freezed,
    Object woeId = freezed,
    Object lattLong = freezed,
    Object distance = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      locationType: locationType == freezed
          ? _value.locationType
          : locationType as String,
      woeId: woeId == freezed ? _value.woeId : woeId as int,
      lattLong: lattLong == freezed ? _value.lattLong : lattLong as String,
      distance: distance == freezed ? _value.distance : distance as int,
    ));
  }
}

abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      @JsonKey(name: 'location_type') String locationType,
      @JsonKey(name: 'woeid') int woeId,
      @JsonKey(name: 'latt_long') String lattLong,
      int distance});
}

class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object title = freezed,
    Object locationType = freezed,
    Object woeId = freezed,
    Object lattLong = freezed,
    Object distance = freezed,
  }) {
    return _then(_Location(
      title: title == freezed ? _value.title : title as String,
      locationType: locationType == freezed
          ? _value.locationType
          : locationType as String,
      woeId: woeId == freezed ? _value.woeId : woeId as int,
      lattLong: lattLong == freezed ? _value.lattLong : lattLong as String,
      distance: distance == freezed ? _value.distance : distance as int,
    ));
  }
}

@JsonSerializable()
class _$_Location with DiagnosticableTreeMixin implements _Location {
  const _$_Location(
      {this.title,
      @JsonKey(name: 'location_type') this.locationType,
      @JsonKey(name: 'woeid') this.woeId,
      @JsonKey(name: 'latt_long') this.lattLong,
      this.distance});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$_$_LocationFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'location_type')
  final String locationType;
  @override
  @JsonKey(name: 'woeid')
  final int woeId;
  @override
  @JsonKey(name: 'latt_long')
  final String lattLong;
  @override
  final int distance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Location(title: $title, locationType: $locationType, woeId: $woeId, lattLong: $lattLong, distance: $distance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Location'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('locationType', locationType))
      ..add(DiagnosticsProperty('woeId', woeId))
      ..add(DiagnosticsProperty('lattLong', lattLong))
      ..add(DiagnosticsProperty('distance', distance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.locationType, locationType) ||
                const DeepCollectionEquality()
                    .equals(other.locationType, locationType)) &&
            (identical(other.woeId, woeId) ||
                const DeepCollectionEquality().equals(other.woeId, woeId)) &&
            (identical(other.lattLong, lattLong) ||
                const DeepCollectionEquality()
                    .equals(other.lattLong, lattLong)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(locationType) ^
      const DeepCollectionEquality().hash(woeId) ^
      const DeepCollectionEquality().hash(lattLong) ^
      const DeepCollectionEquality().hash(distance);

  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {String title,
      @JsonKey(name: 'location_type') String locationType,
      @JsonKey(name: 'woeid') int woeId,
      @JsonKey(name: 'latt_long') String lattLong,
      int distance}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: 'location_type')
  String get locationType;
  @override
  @JsonKey(name: 'woeid')
  int get woeId;
  @override
  @JsonKey(name: 'latt_long')
  String get lattLong;
  @override
  int get distance;
  @override
  _$LocationCopyWith<_Location> get copyWith;
}
