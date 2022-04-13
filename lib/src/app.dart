import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import './view/view.dart';

class VideoCode extends StatelessWidget {
  const VideoCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Video Code",
      theme: yaruLight,
      darkTheme: yaruDark,
      home: const Homepage(),
    );
  }
}
