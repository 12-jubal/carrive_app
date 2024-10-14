import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/documents/documents_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentsCubit extends Cubit<DocumentsState> {
  final User user;
  DocumentsCubit({required this.user}) : super(DocumentsInitial());
}
