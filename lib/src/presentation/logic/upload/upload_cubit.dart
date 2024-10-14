import 'dart:io';
import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/presentation/logic/upload/upload_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadCubit extends Cubit<UploadState> {
  // final picker = ImagePicker();
  final AppLocalizations localizations;

  UploadCubit({required this.localizations}) : super(UploadInitial());

  // Handle selection of an option
  String selectOption(String option) {
    emit(state.copyWith(option: option));
    print(option);
    if (option == localizations.uploadImage) {
      pickImage();
    } else if (option == localizations.uploadFile) {
      pickPDF();
    }
    return option;
  }

  // Function to pick image
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(ImagePicked(File(pickedFile.path)));
    }
  }

  // Function to pick a PDF
  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      emit(PDFPicked(File(result.files.single.path!)));
    }
  }

  // // Function to clear image
  // void clearImage() {
  //   emit(UploadInitial());
  // }
}
