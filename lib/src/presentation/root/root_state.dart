import 'package:carrive_app/src/utils/constants/enums.dart';

class RootState {
  final int index;
  final NavbarItem item;

  RootState({
    required this.index,
    required this.item,
  });

  RootState copyWith({
    int? index,
    NavbarItem? item,
  }) {
    return RootState(
      index: index ?? this.index,
      item: item ?? this.item,
    );
  }
}
