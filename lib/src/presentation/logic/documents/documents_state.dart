class DocumentsState {}

class DocumentsInitial extends DocumentsState {}

class DocumentsLoading extends DocumentsState {}

class DocumentsLoaded extends DocumentsState {}

class DocumentsError extends DocumentsState {
  final String message;

  DocumentsError(this.message);
}
