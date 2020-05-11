part of 'theme_bloc.dart';

/// An interface to specify theme states.
@freezed
abstract class ThemeState with _$ThemeState {
  /// Specifies a theme state for a given [ThemeEntity].
  const factory ThemeState({@required ThemeEntity themeEntity}) = _ThemeState;
}
