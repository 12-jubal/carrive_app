import 'dart:io';

class UploadState {
  final String? option;

  const UploadState({this.option});

  // Create a copywith method to allow state updates without losing other data
  UploadState copyWith({String? option}) {
    return UploadState(option: option ?? this.option);
  }
}

class UploadInitial extends UploadState {}

class ImagePicked extends UploadState {
  final File image;
  ImagePicked(this.image);
}

class PDFPicked extends UploadState {
  final File pdf;
  PDFPicked(this.pdf);
}
