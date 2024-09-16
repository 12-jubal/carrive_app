import '../../../utils/constants/enums.dart';

class WelcomeState {
  final UserType? selectedType;

  const WelcomeState({this.selectedType});

  WelcomeState copyWith({UserType? selectedType}) => WelcomeState(
        selectedType: selectedType ?? this.selectedType,
      );
}
