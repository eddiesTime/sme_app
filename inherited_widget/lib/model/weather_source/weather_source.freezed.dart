// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WeatherSource _$WeatherSourceFromJson(Map<String, dynamic> json) {
  return _WeatherSource.fromJson(json);
}

class _$WeatherSourceTearOff {
  const _$WeatherSourceTearOff();

  _WeatherSource call(
      {@JsonKey(name: 'crawl_rate') int crawlRate,
      String title,
      String slug,
      String url}) {
    return _WeatherSource(
      crawlRate: crawlRate,
      title: title,
      slug: slug,
      url: url,
    );
  }
}

// ignore: unused_element
const $WeatherSource = _$WeatherSourceTearOff();

mixin _$WeatherSource {
  @JsonKey(name: 'crawl_rate')
  int get crawlRate;
  String get title;
  String get slug;
  String get url;

  Map<String, dynamic> toJson();
  $WeatherSourceCopyWith<WeatherSource> get copyWith;
}

abstract class $WeatherSourceCopyWith<$Res> {
  factory $WeatherSourceCopyWith(
          WeatherSource value, $Res Function(WeatherSource) then) =
      _$WeatherSourceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'crawl_rate') int crawlRate,
      String title,
      String slug,
      String url});
}

class _$WeatherSourceCopyWithImpl<$Res>
    implements $WeatherSourceCopyWith<$Res> {
  _$WeatherSourceCopyWithImpl(this._value, this._then);

  final WeatherSource _value;
  // ignore: unused_field
  final $Res Function(WeatherSource) _then;

  @override
  $Res call({
    Object crawlRate = freezed,
    Object title = freezed,
    Object slug = freezed,
    Object url = freezed,
  }) {
    return _then(_value.copyWith(
      crawlRate: crawlRate == freezed ? _value.crawlRate : crawlRate as int,
      title: title == freezed ? _value.title : title as String,
      slug: slug == freezed ? _value.slug : slug as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

abstract class _$WeatherSourceCopyWith<$Res>
    implements $WeatherSourceCopyWith<$Res> {
  factory _$WeatherSourceCopyWith(
          _WeatherSource value, $Res Function(_WeatherSource) then) =
      __$WeatherSourceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'crawl_rate') int crawlRate,
      String title,
      String slug,
      String url});
}

class __$WeatherSourceCopyWithImpl<$Res>
    extends _$WeatherSourceCopyWithImpl<$Res>
    implements _$WeatherSourceCopyWith<$Res> {
  __$WeatherSourceCopyWithImpl(
      _WeatherSource _value, $Res Function(_WeatherSource) _then)
      : super(_value, (v) => _then(v as _WeatherSource));

  @override
  _WeatherSource get _value => super._value as _WeatherSource;

  @override
  $Res call({
    Object crawlRate = freezed,
    Object title = freezed,
    Object slug = freezed,
    Object url = freezed,
  }) {
    return _then(_WeatherSource(
      crawlRate: crawlRate == freezed ? _value.crawlRate : crawlRate as int,
      title: title == freezed ? _value.title : title as String,
      slug: slug == freezed ? _value.slug : slug as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

@JsonSerializable()
class _$_WeatherSource with DiagnosticableTreeMixin implements _WeatherSource {
  const _$_WeatherSource(
      {@JsonKey(name: 'crawl_rate') this.crawlRate,
      this.title,
      this.slug,
      this.url});

  factory _$_WeatherSource.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherSourceFromJson(json);

  @override
  @JsonKey(name: 'crawl_rate')
  final int crawlRate;
  @override
  final String title;
  @override
  final String slug;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherSource(crawlRate: $crawlRate, title: $title, slug: $slug, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherSource'))
      ..add(DiagnosticsProperty('crawlRate', crawlRate))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherSource &&
            (identical(other.crawlRate, crawlRate) ||
                const DeepCollectionEquality()
                    .equals(other.crawlRate, crawlRate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(crawlRate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(url);

  @override
  _$WeatherSourceCopyWith<_WeatherSource> get copyWith =>
      __$WeatherSourceCopyWithImpl<_WeatherSource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherSourceToJson(this);
  }
}

abstract class _WeatherSource implements WeatherSource {
  const factory _WeatherSource(
      {@JsonKey(name: 'crawl_rate') int crawlRate,
      String title,
      String slug,
      String url}) = _$_WeatherSource;

  factory _WeatherSource.fromJson(Map<String, dynamic> json) =
      _$_WeatherSource.fromJson;

  @override
  @JsonKey(name: 'crawl_rate')
  int get crawlRate;
  @override
  String get title;
  @override
  String get slug;
  @override
  String get url;
  @override
  _$WeatherSourceCopyWith<_WeatherSource> get copyWith;
}
