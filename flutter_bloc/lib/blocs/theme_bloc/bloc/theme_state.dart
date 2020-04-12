part of 'theme_bloc.dart';

@immutable
class ThemeState {
  final ThemeData theme;
  final MaterialColor color;

  ThemeState(
      {@required ThemeData this.theme, @required MaterialColor this.color})
      : assert(theme != null),
        assert(color != null);
}
