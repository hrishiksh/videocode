import "package:bloc/bloc.dart";
import 'package:tuple/tuple.dart';
import 'package:process_run/shell.dart';
import 'package:path/path.dart' as p;

enum VideoProcessResult { success, error, unknown, running }

class VideoProcessBloc extends Cubit<Tuple2<VideoProcessResult, int>> {
  VideoProcessBloc() : super(const Tuple2(VideoProcessResult.unknown, 0));

  var _shell = Shell();

  void removeVideoMetadata(String filePath) {
    emit(
      const Tuple2(VideoProcessResult.running, 0),
    );
    try {
      Future result = _shell.run('''
    ffmpeg -i "$filePath" -map_metadata -1 -c:v copy -c:a copy "${p.dirname(filePath)}/new-${p.basename(filePath)}"
    ''');

      result.whenComplete(
        () => emit(
          const Tuple2(VideoProcessResult.success, 0),
        ),
      );
    } catch (e) {
      emit(
        const Tuple2(VideoProcessResult.error, 0),
      );
    }
  }

  void encodeForDavinciResolve(String filePath) {
    emit(
      const Tuple2(VideoProcessResult.running, 1),
    );

    try {
      Future result = _shell.run('''
    ffmpeg -i "$filePath" -codec:v mpeg4 -q:v 0 -codec:a pcm_s16le "${p.dirname(filePath)}/new-${p.basenameWithoutExtension(filePath)}.mov"
    ''');

      result.whenComplete(
        () => emit(
          const Tuple2(VideoProcessResult.success, 1),
        ),
      );
    } catch (e) {
      emit(
        const Tuple2(VideoProcessResult.error, 1),
      );
    }
  }
}
