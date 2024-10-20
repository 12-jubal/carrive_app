import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/profile/profile_state.dart';
import 'package:carrive_app/src/utils/storage/user_sp_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final User user;
  final AppLocalizations locale;
  ProfileCubit({required this.user, required this.locale})
      : super(ProfileInitial());

  void signOut() async {
    // emitting loading state
    emit(ProfileLoading(message: locale.signingOut));
    await UserSharedPreferencesHelper.clearUser();
    await Future.delayed(const Duration(seconds: 3));
    emit(ProfileSignOut());
  }

  void selectLanguage(String language) {
    FlutterLocalization localization = FlutterLocalization.instance;
    if (language == locale.english) {
      localization.translate('en');
    } else if (language == locale.french) {
      localization.translate('fr');
    }
  }
}
