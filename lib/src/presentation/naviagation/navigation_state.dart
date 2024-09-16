import 'package:carrive_app/src/utils/constants/enums.dart';

class NavigationState {
  final int index;
  final NavbarItem item;

  NavigationState({
    required this.index,
    required this.item,
  });

  NavigationState copyWith({
    int? index,
    NavbarItem? item,
  }) {
    return NavigationState(
      index: index ?? this.index,
      item: item ?? this.item,
    );
  }
}
