import 'package:carrive_app/src/presentation/logic/create_ride/create_ride_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRideCubit extends Cubit<CreateRideState> {
  CreateRideCubit() : super(CreateRideInitial());

  // final CreateRideUseCase _createRideUseCase;

  // Future<void> createRide(CreateRideRequest request) async {
  //   emit(CreateRideLoading());
  //   final result = await _createRideUseCase(request);
  //   result.fold(
  //     (failure) => emit(CreateRideError(failure)),
  //     (success) => emit(CreateRideSuccess(success)),
  //   );
  // }
}
