import 'package:flutter/material.dart';

class PrototypeHeight extends StatelessWidget {
  final Widget prototype;
  final Widget child;

  const PrototypeHeight({
    Key? key,
    required this.prototype,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: Opacity(
            opacity: 0.0,
            child: prototype,
          ),
        ),
        SizedBox(width: double.infinity),
        Positioned.fill(child: child),
      ],
    );
  }
}
