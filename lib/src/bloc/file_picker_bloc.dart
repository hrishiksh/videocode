import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerCubit extends Cubit<String> {
  FilePickerCubit() : super("");

  /// Emit either a filepath or an empty string
  void pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);

    emit(result?.files.single.path ?? "");
  }
}
