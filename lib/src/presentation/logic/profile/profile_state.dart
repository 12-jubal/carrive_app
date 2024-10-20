class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  final String message;

  ProfileLoading({required this.message});
}

class ProfileLoaded extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

class ProfileSignOut extends ProfileState {}
