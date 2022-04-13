import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';

class FilePickerSection extends StatelessWidget {
  const FilePickerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilePickerCubit, String>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/filepicker.png",
              height: 400,
              width: 400,
            ),
            Text(state == "" ? "No file selected" : state.split("/").last),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                context.read<FilePickerCubit>().pickFiles();
              },
              child: const Text("Select a video file"),
            ),
          ],
        );
      },
    );
  }
}
