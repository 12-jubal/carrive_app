import 'package:carrive_app/src/presentation/logic/explore_logic/passenger_explore/pe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassengerExploreCubit extends Cubit<PassengerExploreState> {
  PassengerExploreCubit() : super(PassengerExploreInitial());
}
