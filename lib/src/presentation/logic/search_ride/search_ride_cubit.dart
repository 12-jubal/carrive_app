import 'package:carrive_app/src/presentation/logic/search_ride/search_ride_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRideCubit extends Cubit<SearchRideState> {
  SearchRideCubit() : super(SearchRideInitial());
}
