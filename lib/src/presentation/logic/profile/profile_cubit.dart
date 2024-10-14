import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final User user;
  ProfileCubit({required this.user}) : super(ProfileInitial());

  void signOut() {
    emit(ProfileSignOut());
  }
}
