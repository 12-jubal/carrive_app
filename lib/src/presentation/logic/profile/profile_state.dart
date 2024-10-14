class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class ProfileSignOut extends ProfileState {}
