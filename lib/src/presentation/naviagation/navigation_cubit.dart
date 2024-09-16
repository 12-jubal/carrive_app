import 'package:carrive_app/src/presentation/naviagation/navigation_state.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState(index: 0, item: NavbarItem.explore));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.explore:
        emit(NavigationState(index: 0, item: NavbarItem.explore));
        break;
      case NavbarItem.chat:
        emit(NavigationState(index: 1, item: NavbarItem.chat));
        break;
      case NavbarItem.bookings:
        emit(NavigationState(index: 2, item: NavbarItem.bookings));
        break;
      case NavbarItem.profile:
        emit(NavigationState(index: 3, item: NavbarItem.profile));
        break;
    }
  }
}
