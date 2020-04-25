part of 'theme_bloc.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({@required ThemeEntity themeEntity}) = _ThemeState;
}
