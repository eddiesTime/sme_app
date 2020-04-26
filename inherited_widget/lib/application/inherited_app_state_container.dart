import 'package:flutter/widgets.dart';
import 'package:inherited_widget/presentation/app_state_container.dart';

class InheritedAppStateContainer extends InheritedWidget {
  const InheritedAppStateContainer(
      {Key key, @required Widget child, @required this.data})
      : super(key: key, child: child);

  final AppStateContainerState data;

  static InheritedAppStateContainer of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedAppStateContainer>();
  }

  @override
  bool updateShouldNotify(InheritedAppStateContainer oldWidget) => true;
}
