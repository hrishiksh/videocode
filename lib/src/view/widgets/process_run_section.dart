import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './widgets.dart';
import '../../bloc/bloc.dart';
import 'package:tuple/tuple.dart';

class ProcessRunSection extends StatelessWidget {
  const ProcessRunSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoProcessBloc, Tuple2<VideoProcessResult, int>>(
      builder: ((context, state) {
        return BlocBuilder<FilePickerCubit, String>(
          builder: (context, pathstate) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlineIconButton(
                  title: "Remove video metadata",
                  icon: state.item2 == 0
                      ? IconGenerator(result: state.item1)
                      : const Icon(Icons.arrow_right_alt_rounded),
                  ontap: () {
                    context
                        .read<VideoProcessBloc>()
                        .removeVideoMetadata(pathstate);
                  },
                ),
                const SizedBox(height: 20),
                OutlineIconButton(
                  title: "Encode for davinciResolve",
                  icon: state.item2 == 1
                      ? IconGenerator(result: state.item1)
                      : const Icon(Icons.arrow_right_alt_rounded),
                  ontap: () {
                    context
                        .read<VideoProcessBloc>()
                        .encodeForDavinciResolve(pathstate);
                  },
                ),
                const SizedBox(height: 20),
                OutlineIconButton(
                  title: "Custom Option",
                  icon: state.item2 == 2
                      ? IconGenerator(result: state.item1)
                      : const Icon(Icons.arrow_right_alt_rounded),
                  ontap: () {},
                ),
              ],
            );
          },
        );
      }),
    );
  }
}

class IconGenerator extends StatelessWidget {
  const IconGenerator({Key? key, required this.result}) : super(key: key);

  final VideoProcessResult result;

  @override
  Widget build(BuildContext context) {
    if (result == VideoProcessResult.running) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    } else if (result == VideoProcessResult.success) {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    } else if (result == VideoProcessResult.error) {
      return const Icon(
        Icons.error_outline_rounded,
        color: Colors.red,
      );
    }
    return const Icon(Icons.arrow_right_alt_rounded);
  }
}
