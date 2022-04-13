import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilePickerCubit(),
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const FilePickerSection(),
              const SizedBox(width: 100),
              BlocProvider(
                create: (context) => VideoProcessBloc(),
                child: const ProcessRunSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
