import 'package:carrive_app/src/presentation/logic/explore_logic/driver_explore/de_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverExploreCubit extends Cubit<DriverExploreState> {
  DriverExploreCubit() : super(DriverExploreInitial());
}
