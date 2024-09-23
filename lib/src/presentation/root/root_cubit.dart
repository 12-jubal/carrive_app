import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/root/root_state.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootCubit extends Cubit<RootState> {
  final User user;
  RootCubit({required this.user})
      : super(RootState(index: 0, item: NavbarItem.explore));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.explore:
        emit(RootState(index: 0, item: NavbarItem.explore));
        break;
      case NavbarItem.chat:
        emit(RootState(index: 1, item: NavbarItem.chat));
        break;
      case NavbarItem.bookings:
        emit(RootState(index: 2, item: NavbarItem.bookings));
        break;
      case NavbarItem.profile:
        emit(RootState(index: 3, item: NavbarItem.profile));
        break;
    }
  }
}
