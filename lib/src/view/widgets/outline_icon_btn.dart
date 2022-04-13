import 'package:flutter/material.dart';

class OutlineIconButton extends StatelessWidget {
  const OutlineIconButton(
      {Key? key, required this.title, required this.ontap, required this.icon})
      : super(key: key);

  final String title;
  final void Function() ontap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            fixedSize: MaterialStateProperty.all(
              const Size(280, 70),
            ),
            side: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return const BorderSide(color: Colors.green);
                }
              },
            ),
          ),
      onPressed: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
          ),
          icon,
        ],
      ),
    );
  }
}
